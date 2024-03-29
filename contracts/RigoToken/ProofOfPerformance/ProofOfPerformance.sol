/*

 Copyright 2017-2018 RigoBlock, Rigo Investment Sagl.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.

*/

pragma solidity ^0.4.21;
pragma experimental "v0.5.0";

import { PoolFace as Pool } from "../../Pool/PoolFace.sol";
import { RigoToken } from "../RigoToken/RigoToken.sol";
import { DragoRegistryFace as DragoRegistry } from "../../Registry/DragoRegistry.sol";
import { InflationFace as Inflation } from "../Inflation/InflationFace.sol";

import { SafeMath } from "../../utils/SafeMath/SafeMath.sol";
import { ProofOfPerformanceFace } from "./ProofOfPerformanceFace.sol";

contract ProofOfPerformance is SafeMath, ProofOfPerformanceFace {

    address public RIGOTOKENADDRESS;

    address public dragoRegistry;
    address public rigoblockDao;
    uint256 public minimumRigo;

    mapping (uint => PoolPrice) poolPrice;
    mapping (address => Group) groups;

    struct PoolPrice {
        uint highwatermark;
    }

    struct Group {
        uint rewardRatio;
    }

    modifier onlyRigoblockDao {
        require(msg.sender == rigoblockDao);
        _;
    }

    modifier minimumRigoblock {
        RigoToken rigoToken = RigoToken(RIGOTOKENADDRESS);
        require(rigoToken.balanceOf(msg.sender) >= minimumRigo);
        _;
    }

    function ProofOfPerformance(
        address _rigoTokenAddress,
        address _rigoblockDao,
        address _dragoRegistry)
        public
    {
        RIGOTOKENADDRESS = _rigoTokenAddress;
        rigoblockDao = _rigoblockDao;
        dragoRegistry = _dragoRegistry;
    }

    // CORE FUNCTIONS

    function claimPop(uint _ofPool)
        external
    {
        Inflation infl = Inflation(getMinter());
        DragoRegistry registry = DragoRegistry(dragoRegistry);
        address poolAddress;
        (poolAddress, , , , , ) = registry.fromId(_ofPool);
        uint pop = proofOfPerformance(_ofPool);
        uint price;
        uint supply;
        (price, supply) = getPoolPrice(_ofPool);
        poolPrice[_ofPool].highwatermark = price;
        require(infl.mintInflation(poolAddress, pop));
    }

    function setRegistry(address _dragoRegistry)
        external
        onlyRigoblockDao
    {
        dragoRegistry = _dragoRegistry;
    }

    function setRigoblockDao(address _rigoblockDao)
        external
        onlyRigoblockDao
    {
        rigoblockDao = _rigoblockDao;
    }

    function setMinimumRigo(uint256 _amount)
        external
        onlyRigoblockDao
    {
        minimumRigo = _amount;
    }

    /// @notice onlyRigoblockDao can set ratio, as it determines
    /// @notice the split between asset and performance reward for a said group
    function setRatio(address _ofGroup, uint _ratio)
        external
        onlyRigoblockDao
    {
        require(_ratio <= 10000); //(from 0 to 10000)
        groups[_ofGroup].rewardRatio = _ratio;
    }

    // CONSTANT PUBLIC FUNCTIONS
    
    /// @dev Gets data of a pool
    /// @param _ofPool Id of the pool
    /// @return Bool the pool is active
    /// @return 
    function getPoolData(uint _ofPool)
        external view
        returns (
            bool active,
            address thePoolAddress,
            address thePoolGroup,
            uint thePoolPrice,
            uint thePoolSupply,
            uint poolValue,
            uint epochReward,
            uint ratio,
            uint pop
        )
    {
        active = isActive(_ofPool);
        (thePoolAddress, thePoolGroup) = addressFromId(_ofPool);
        (thePoolPrice, thePoolSupply) = getPoolPrice(_ofPool);
        ( poolValue, ) = calcPoolValue(_ofPool);
        epochReward = getEpochReward(_ofPool);
        ratio = getRatio(_ofPool);
        pop = proofOfPerformance(_ofPool);
    }
    
    /// @dev Returns the highwatermark of a pool
    /// @param _ofPool Id of the pool
    /// @return Value of the all-time-high pool nav
    function getHwm(uint _ofPool)
        external view
        returns (uint)
    {
        return poolPrice[_ofPool].highwatermark;
    }

    /// @dev Returns two arrays of prices and total supply
    /// @return Array of addressed of the active pools
    /// @return Array of the prices of the active pools
    /// @return Array of the number of tokens of each pool
    function getPoolPrices()
        external view
        returns (
            address[] pools,
            uint[] poolPrices,
            uint[] totalTokens
        )
    {
        DragoRegistry registry = DragoRegistry(dragoRegistry);
        uint length = registry.dragoCount();
        for (uint i = 0; i < length; ++i) {
            bool active = isActive(i);
            if (!active) {
                continue;
            }
            address fund;
            address group;
            (fund, group) = addressFromId(i);
            pools[i] = fund;
            Pool pool = Pool(fund);
            uint thePoolPrice;
            ( , , thePoolPrice, ) = pool.getData();
            poolPrices[i] = thePoolPrice;
            totalTokens[i] = pool.totalSupply();
        }
    }

    /// @dev Returns the value of the assets in the rigoblock network
    /// @return Value of the rigoblock network in wei
    /// @return Number of active funds
    function calcNetworkValue()
        external view
        returns (
            uint networkValue,
            uint numberOfFunds
        )
    {
        DragoRegistry registry = DragoRegistry(dragoRegistry);
        uint length = registry.dragoCount();
        for (uint i = 0; i < length; ++i) {
            bool active = isActive(i);
            if (!active) {
                continue;
            }
            uint poolValue;
            (poolValue, ) = calcPoolValue(i);
            networkValue += poolValue;
        }
        return (networkValue, length);
    }
    
    // INTERNAL FUNCTIONS

    /// @dev Returns the reward factor for a pool
    /// @param _ofPool Id of the pool
    /// @return Value of the reward factor
    function getEpochReward(uint _ofPool)
        internal view
        returns (uint)
    {
        Inflation inflate = Inflation(getMinter());
        address fund;
        address group;
        (fund,group) = addressFromId(_ofPool);
        return inflate.getInflationFactor(group);
    }

    /// @dev Returns the split ratio of asset and performance reward
    /// @param _ofPool Id of the pool
    /// @return Value of the ratio from 1 to 100
    function getRatio(uint _ofPool)
        internal view
        returns (uint)
    {
        address fund;
        address group;
        (fund,group) = addressFromId(_ofPool);
        return groups[group].rewardRatio;
    }
    
    /// @dev Returns the address of the Inflation contract
    /// @return Address of the minter/inflation
    function getMinter()
        internal view
        returns (address)
    {
        RigoToken token = RigoToken(RIGOTOKENADDRESS);
        return token.getMinter();
    }

    /// @dev Returns the proof of performance reward for a pool
    /// @param _ofPool Id of the pool
    /// @return Value of the reward in Rigo tokens
    /// @notice epoch reward should be big enough that it
    /// @notice can be decreased if number of funds increases
    /// @notice should be at least 10^6 (just as pool base) to start with
    /// @notice rigo token has 10^18 decimals
    function proofOfPerformance(uint _ofPool)
        internal view
        returns (uint256) 
    {
        uint highwatermark;
        if (poolPrice[_ofPool].highwatermark == 0) {
            highwatermark = 1 ether;
        } else {
            highwatermark = poolPrice[_ofPool].highwatermark;
        }
        uint poolValue;
        (poolValue, ) = calcPoolValue(_ofPool);
        require(poolValue != 0);
        uint newPrice;
        uint tokenSupply;
        (newPrice, tokenSupply) = getPoolPrice(_ofPool);
        require (newPrice >= highwatermark);
        uint epochReward = getEpochReward(_ofPool);
        uint rewardRatio = getRatio(_ofPool);
        uint prevPrice = highwatermark;
        uint priceDiff = safeSub(newPrice, prevPrice);
        uint performanceReward = priceDiff * tokenSupply * epochReward * rewardRatio / 10000 ether;
        uint assetsReward = poolValue * epochReward * (10000 - rewardRatio) / 10000 ether;
        return performanceReward + assetsReward;
    }
    
    /// @dev Checks whether a pool is registered and active
    /// @param _ofPool Id of the pool
    /// @return Bool the pool is active
    function isActive(uint _ofPool)
        internal view
        returns (bool)
    {
        DragoRegistry registry = DragoRegistry(dragoRegistry);
        address thePool;
        (thePool, , , , , ) = registry.fromId(_ofPool);
        if (thePool != address(0)) {
            return true;
        }
    }

    /// @dev Returns the address and the group of a pool from its id
    /// @param _ofPool Id of the pool
    /// @return Address of the target pool
    /// @return Address of the pool's group
    function addressFromId(uint _ofPool)
        internal view
        returns (
            address pool,
            address group
        )
    {
        DragoRegistry registry = DragoRegistry(dragoRegistry);
        address thePool;
        address theGroup;
        (thePool, , , , , theGroup) = registry.fromId(_ofPool);
        pool = thePool;
        group = theGroup;
    }

    /// @dev Returns the price a pool from its id
    /// @param _ofPool Id of the pool
    /// @return Price of the pool in wei
    /// @return Number of tokens of a pool (totalSupply)
    function getPoolPrice(uint _ofPool)
        internal view
        returns (
            uint thePoolPrice,
            uint totalTokens
        )
    {
        address fund;
        address group;
        (fund,group) = addressFromId(_ofPool);
        address poolAddress = fund;
        Pool pool = Pool(poolAddress);
        ( , , thePoolPrice, ) = pool.getData();
        totalTokens = pool.totalSupply();
    }
    
    /// @dev Returns the address and the group of a pool from its id
    /// @param _ofPool Id of the pool
    /// @return Address of the target pool
    /// @return Address of the pool's group
    function calcPoolValue(uint256 _ofPool)
        internal view
        returns (
            uint256 aum,
            bool success
        )
    {
        uint price;
        uint supply;
        (price,supply) = getPoolPrice(_ofPool);
        return (aum = price * supply / 1000000, true); //1000000 is the base (decimals)
    }
}

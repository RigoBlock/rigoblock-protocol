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
import { AuthorityFace as Authority } from "../../Authority/AuthorityFace.sol";

import { SafeMath } from "../../utils/SafeMath/SafeMath.sol";
import { InflationFace } from "./InflationFace.sol";

/// @title Inflation - Allows ProofOfPerformance to mint tokens.
/// @author Gabriele Rigo - <gab@rigoblock.com>
contract Inflation is SafeMath, InflationFace {

    address public RIGOTOKENADDRESS;

    uint public period = 12 weeks; //inflation tokens can be minted every 3 months
    uint minimumRigo;
    address public proofOfPerformance;
    address public authority;
    address public rigoblockDao;

    mapping(address => Performer) performers;
    mapping(address => Group) groups;

    struct Performer {
        uint claimedTokens;
        mapping(uint => bool) claim;
        uint startTime;
        uint endTime;
        uint epoch;
    }

    struct Group {
        uint epochReward;
    }

    /// @notice in order to qualify for PoP user has to told minimum rigo token
    modifier minimumRigoblock(address _ofPool) {
        RigoToken rigoToken = RigoToken(RIGOTOKENADDRESS);
        require(rigoToken.balanceOf(getPoolOwner(_ofPool)) >= minimumRigo);
        _;
    }

    modifier onlyRigoblockDao {
        require(msg.sender == rigoblockDao);
        _;
    }

    modifier onlyProofOfPerformance {
        require(msg.sender == proofOfPerformance);
        _;
    }

    modifier isApprovedFactory(address _factory) {
        Authority auth = Authority(authority);
        require(auth.isWhitelistedFactory(_factory));
        _;
    }

    modifier timeAtLeast(address _thePool) {
        require(now >= performers[_thePool].endTime);
        _;
    }

    function Inflation(
        address _rigoTokenAddress,
        address _proofOfPerformance,
        address _authority)
        public
    {
        RIGOTOKENADDRESS = _rigoTokenAddress;
        rigoblockDao = msg.sender;
        proofOfPerformance = _proofOfPerformance;
        authority = _authority;
    }

    // CORE FUNCTIONS

    /// @dev Allows ProofOfPerformance to mint rewards
    /// @param _thePool Address of the target pool
    /// @param _reward Number of reward in Rigo tokens
    /// @return Bool the transaction executed correctly
    function mintInflation(address _thePool, uint _reward)
        external
        onlyProofOfPerformance
        minimumRigoblock(_thePool)
        timeAtLeast(_thePool)
        returns (bool)
    {
        performers[_thePool].startTime = now;
        performers[_thePool].endTime = now + period;
        ++performers[_thePool].epoch;
        uint reward = _reward * 95 / 100; //5% royalty to rigoblock dao
        uint rigoblockReward = safeSub(_reward, reward);
        RigoToken rigoToken = RigoToken(RIGOTOKENADDRESS);
        rigoToken.mintToken(getPoolOwner(_thePool), reward);
        rigoToken.mintToken(rigoblockDao, rigoblockReward);
        return true;
    }

    /// @dev Allows rigoblock dao to set the inflation factor for a group
    /// @param _group Address of the group/factory
    /// @param _inflationFactor Value of the reward factor
    function setInflationFactor(address _group, uint _inflationFactor)
        external
        onlyRigoblockDao
        isApprovedFactory(_group)
    {
        groups[_group].epochReward = _inflationFactor;
    }

    /// @dev Allows rigoblock dao to set the minimum number of required tokens
    /// @param _minimum Number of minimum tokens
    function setMinimumRigo(uint _minimum)
        external
        onlyRigoblockDao
    {
        minimumRigo = _minimum;
    }

    /// @dev Allows rigoblock dao to upgrade its address
    /// @param _newRigoblock Address of the new rigoblock dao
    function setRigoblock(address _newRigoblock)
        external
        onlyRigoblockDao
    {
        rigoblockDao = _newRigoblock;
    }

    /// @dev Allows rigoblock dao to update the authority
    /// @param _authority Address of the authority
    function setAuthority(address _authority)
        external
        onlyRigoblockDao
    {
        authority = _authority;
    }

    /// @dev Allows rigoblock dao to update proof of performance
    /// @param _pop Address of the Proof of Performance contract
    function setProofOfPerformance(address _pop)
        external
        onlyRigoblockDao
    {
        proofOfPerformance = _pop;
    }

    /// @dev Allows rigoblock dao to set the minimum time between reward collection
    /// @param _newPeriod Number of blocks from 2 rewards
    /// @notice set period on shorter subsets of time for testing
    function setPeriod(uint _newPeriod)
        external
        onlyRigoblockDao
    {
        period = _newPeriod;
    }

    // CONSTANT PUBLIC FUNCTIONS

    /// @dev Returns whether a wizard can claim reward tokens
    /// @param _thePool Address of the target pool
    /// @return Bool the wizard can claim
    function canWithdraw(address _thePool)
        external view
        returns (bool)
    {
        return (now >= performers[_thePool].endTime ? true : false);
    }

    /// @dev Return the reward factor for a group
    /// @param _group Address of the group
    /// @return Value of the reward factor
    function getInflationFactor(address _group)
        external view
        returns (uint)
    {
        return groups[_group].epochReward;
    }
    
    // INTERNAL FUNCTIONS
    
    /// @dev Returns the address of the pool owner
    /// @param _ofPool Number of the registered pool
    /// @return Address of the pool owner
    function getPoolOwner(address _ofPool)
        internal view
        returns (address poolOwner)
    {
        Pool pool = Pool(_ofPool);
        (poolOwner, , , , , ) = pool.getAdminData();
    }
}

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

import { AuthorityFace as Authority } from "../Authority/AuthorityFace.sol";
import { DragoEventfulFace } from "./DragoEventfulFace.sol";

/// @title Drago Eventful contract.
/// @author Gabriele Rigo - <gab@rigoblock.com>
contract DragoEventful is DragoEventfulFace {

    string public constant VERSION = 'DH0.4.1';

    address public AUTHORITY;

    event BuyDrago(
        address indexed drago,
        address indexed from,
        address indexed to,
        uint256 amount,
        uint256 revenue,
        bytes name,
        bytes symbol
    );

    event SellDrago(
        address indexed drago,
        address indexed from,
        address indexed to,
        uint256 amount,
        uint256 revenue,
        bytes name,
        bytes symbol
    );

    event NewRatio(
        address indexed drago,
        address indexed from,
        uint newRatio
    );

    event NewNAV(
        address indexed drago,
        address indexed from,
        address indexed to,
        uint sellPrice,
        uint buyPrice
    );

    event NewFee(
        address indexed targetDrago,
        address indexed group,
        address indexed who,
        uint transactionFee
    );

    event NewCollector(
        address indexed targetDrago,
        address indexed group,
        address indexed who,
        address feeCollector
    );

    event DragoDao(
        address indexed drago,
        address indexed from,
        address indexed to,
        address dragoDao
    );

    event DepositExchange(
        address indexed drago,
        address indexed exchange,
        address indexed token,
        uint value,
        uint256 amount
    );

    event WithdrawExchange(
        address indexed drago,
        address indexed exchange,
        address indexed token,
        uint value,
        uint256 amount
    );

    event OrderExchange(
        address indexed drago,
        address indexed exchange,
        address indexed cfd,
        uint value,
        uint revenue
    );

    event TradeExchange(
        address indexed drago,
        address indexed exchange,
        address tokenGet,
        address tokenGive,
        uint amountGet,
        uint amountGive,
        address get
    );

    event CancelOrder(
        address indexed drago,
        address indexed exchange,
        address indexed cfd,
        uint value,
        uint id
    );

    event DealFinalized(
        address indexed drago,
        address indexed exchange,
        address indexed cfd,
        uint value,
        uint id
    );

    event DragoCreated(
        address indexed drago,
        address indexed group,
        address indexed owner,
        uint dragoId,
        string name,
        string symbol
    );

    modifier approvedFactoryOnly(address _factory) {
        Authority auth = Authority(AUTHORITY);
        require(auth.isWhitelistedFactory(_factory));
        _;
    }

    modifier approvedDragoOnly(address _drago) {
        Authority auth = Authority(AUTHORITY);
        require(auth.isWhitelistedDrago(_drago));
        _;
    }

    modifier approvedExchangeOnly(address _exchange) {
        Authority auth = Authority(AUTHORITY);
        require(auth.isWhitelistedExchange(_exchange));
        _;
    }

    modifier approvedUserOnly(address _user) {
        Authority auth = Authority(AUTHORITY);
        require(auth.isWhitelistedUser(_user));
        _;
    }

    modifier approvedAsset(address _asset) {
        Authority auth = Authority(AUTHORITY);
        require(auth.isWhitelistedAsset(_asset));
        _;
    }

    function DragoEventful(address _authority) public {
        AUTHORITY = _authority;
    }

    // CORE FUNCTIONS

    /// @dev Logs a Buy Drago event.
    /// @param _who Address of who is buying
    /// @param _targetDrago Address of the target drago
    /// @param _value Value of the transaction in Ether
    /// @param _amount Number of shares purchased
    /// @return Bool the transaction executed successfully
    function buyDrago(
        address _who,
        address _targetDrago,
        uint _value,
        uint _amount,
        bytes _name,
        bytes _symbol)
        external
        approvedDragoOnly(msg.sender)
        returns (bool success)
    {
        buyDragoInternal(_targetDrago, _who, msg.sender, _value, _amount, _name, _symbol);
        return true;
    }

    /// @dev Logs a Sell Drago event.
    /// @param _who Address of who is selling
    /// @param _targetDrago Address of the target drago
    /// @param _amount Number of shares purchased
    /// @param _revenue Value of the transaction in Ether
    /// @return Bool the transaction executed successfully
    function sellDrago(
        address _who,
        address _targetDrago,
        uint _amount,
        uint _revenue,
        bytes _name,
        bytes _symbol)
        external
        approvedDragoOnly(msg.sender)
        returns(bool success)
    {
        require(_amount > 0);
        sellDragoInternal(_targetDrago, _who, msg.sender, _amount, _revenue, _name, _symbol);
        return true;
    }

    /// @dev Logswhen rigoblock dao changes fee split.
    /// @param _who Address of the caller
    /// @param _targetDrago Address of the target drago
    /// @param _ratio Ratio number from 0 to 100
    /// @return Bool the transaction executed successfully
    function changeRatio(
        address _who,
        address _targetDrago,
        uint256 _ratio)
        external
        approvedDragoOnly(msg.sender)
        returns(bool success)
    {
        require(_ratio > 0);
        emit NewRatio(_targetDrago, _who, _ratio);
        return true;
    }

    /// @dev Logs when wizard changes fee collector address
    /// @param _who Address of the caller
    /// @param _targetDrago Address of the target Drago
    /// @param _feeCollector Address of the new fee collector
    /// @return Bool the transaction executed successfully
    function changeFeeCollector(
        address _who,
        address _targetDrago,
        address _feeCollector)
        external
        approvedDragoOnly(msg.sender)
        approvedUserOnly(_who)
        returns(bool success)
    {
        emit NewCollector(_targetDrago, msg.sender, _who, _feeCollector);
        return true;
    }

    /// @dev Logs a change in the drago dao of an approved vault
    /// @param _who Address of the caller
    /// @param _targetDrago Address of the drago
    /// @param _dragoDao Address of the new drago dao
    /// @return Bool the transaction executed successfully
    function changeDragoDao(
        address _who,
        address _targetDrago,
        address _dragoDao)
        external
        approvedDragoOnly(msg.sender)
        approvedUserOnly(_who)
        returns(bool success)
    {
        emit DragoDao(_targetDrago, msg.sender, _who, _dragoDao);
        return true;
    }

    /// @dev Logs a Set Drago Price event
    /// @param _who Address of the caller
    /// @param _targetDrago Address of the target Drago
    /// @param _sellPrice Value of the price of one share in wei
    /// @param _buyPrice Value of the price of one share in wei
    /// @return Bool the transaction executed successfully
    function setDragoPrice(
        address _who,
        address _targetDrago,
        uint _sellPrice,
        uint _buyPrice)
        external
        approvedDragoOnly(msg.sender)
        returns(bool success)
    {
        require(_sellPrice > 10 finney && _buyPrice > 10 finney);
        emit NewNAV(_targetDrago, msg.sender, _who, _sellPrice, _buyPrice);
        return true;
    }

    /// @dev Logs a modification of the transaction fee event
    /// @param _who Address of the caller
    /// @param _targetDrago Address of the target Drago
    /// @param _transactionFee Value of the transaction fee in basis points
    /// @return Bool the transaction executed successfully
    function setTransactionFee(
        address _who,
        address _targetDrago,
        uint _transactionFee)
        external
        approvedDragoOnly(msg.sender)
        approvedUserOnly(_who)
        returns(bool success)
    {
        emit NewFee(_targetDrago, msg.sender, _who, _transactionFee);
        return true;
    }

    /// @dev Logs a Drago Deposit To Exchange event
    /// @param _who Address of the caller
    /// @param _targetDrago Address of the target Drago
    /// @param _exchange Address of the exchange
    /// @param _token Address of the deposited token
    /// @param _value Number of deposited tokens
    /// @return Bool the transaction executed successfully
    function depositToExchange(
        address _who,
        address _targetDrago,
        address _exchange,
        address _token,
        uint256 _value)
        external
        approvedDragoOnly(msg.sender)
        approvedExchangeOnly(_exchange)
        returns(bool success)
    {
        emit DepositExchange(_targetDrago, _exchange, _token, _value, 0);
        return true;
    }

    /// @dev Logs a Drago Withdraw From Exchange event
    /// @param _who Address of the caller
    /// @param _targetDrago Address of the target Drago
    /// @param _exchange Address of the exchange
    /// @param _token Address of the withdrawn token
    /// @param _value Number of withdrawn tokens
    /// @return Bool the transaction executed successfully
    function withdrawFromExchange(
        address _who,
        address _targetDrago,
        address _exchange,
        address _token,
        uint256 _value)
        external
        approvedDragoOnly(msg.sender)
        approvedExchangeOnly(_exchange)
        returns(bool success)
    {
        emit WithdrawExchange(_targetDrago, _exchange, _token, _value, 0);
        return true;
    }

    function placeOrderExchange(
        address _who,
        address _exchange,
        address _targetDrago,
        address _tokenGet,
        uint _amountGet,
        address _tokenGive,
        uint _amountGive,
        uint _expires)
        external
        approvedDragoOnly(msg.sender)
        approvedExchangeOnly(_exchange)
        returns(bool success)
    {
        emit OrderExchange(_targetDrago, _exchange, _tokenGet, _amountGet, 0);
        return true;
    }


    function placeOrderCFDExchange(
        address _who,
        address _targetDrago,
        address _cfdExchange,
        address _cfd,
        bool _is_stable,
        uint32 _adjustment,
        uint128 _stake)
        external
        approvedDragoOnly(msg.sender)
        approvedExchangeOnly(_cfdExchange)
        approvedAsset(_cfd)
        returns(bool success)
    {
        emit OrderExchange(_targetDrago, _cfdExchange, _cfd, _stake, _adjustment);
        return true;
    }


    function placeTradeExchange(
        address _who,
        address _targetDrago,
        address _exchange,
        address _tokenGet,
        uint _amountGet,
        address _tokenGive,
        uint _amountGive,
        uint _expires,
        address _user,
        uint _amount)
        external
        approvedDragoOnly(msg.sender)
        approvedExchangeOnly(_exchange)
        returns(bool success)
    {
        emit TradeExchange(_targetDrago, _exchange, _tokenGet, _tokenGive, _amountGet, _amountGive, _user);
        return true;
    }

    function cancelOrderExchange(
        address _who,
        address _targetDrago,
        address _exchange,
        address _tokenGet,
        uint _amountGet,
        address _tokenGive,
        uint _amountGive,
        uint _expires)
        external
        approvedDragoOnly(msg.sender)
        approvedExchangeOnly(_exchange)
        approvedUserOnly(_who)
        returns(bool success)
    {
        emit CancelOrder(_targetDrago, _exchange, _tokenGet, _amountGet, 0);
        return true;
    }

    function cancelOrderCFDExchange(
        address _who,
        address _targetDrago,
        address _cfdExchange,
        address _cfd,
        uint32 _id)
        external
        approvedDragoOnly(msg.sender)
        approvedExchangeOnly(_cfdExchange)
        approvedAsset(_cfd)
        returns(bool success)
    {
        emit CancelOrder(_targetDrago, _cfdExchange, _cfd, 0,_id);
        return true;
    }

    function finalizeDealCFDExchange(
        address _who,
        address _targetDrago,
        address _exchange,
        address _cfd,
        uint24 _id)
        external
        approvedDragoOnly(msg.sender)
        approvedExchangeOnly(_exchange)
        approvedAsset(_cfd)
        returns(bool success)
    {
        emit DealFinalized(_targetDrago, _exchange, _cfd, 0, _id);
        return true;
    }

    /// @dev Logs a new Drago creation by factory
    /// @param _who Address of the caller
    /// @param _newDrago Address of the new Drago
    /// @param _name String of the name of the new drago
    /// @param _symbol String of the symbol of the new drago
    /// @param _dragoId Number of the new drago Id
    /// @return Bool the transaction executed successfully
    function createDrago(
        address _who,
        address _newDrago,
        string _name,
        string _symbol,
        uint _dragoId)
        external
        approvedFactoryOnly(msg.sender)
        returns(bool success)
    {
        createDragoInternal(_newDrago, msg.sender, _who, _dragoId, _name, _symbol);
        return true;
    }

    // INTERNAL FUNCTIONS

    /// @dev Logs a purchase event
    /// @param _who Address of the caller
    /// @param _targetDrago Address of the drago
    /// @param _factory Address of the factory
    /// @param _value Value of transaction in wei
    /// @param _amount Number of new tokens
    /// @param _name Hex encoded bytes of the name
    /// @param _symbol Hex encoded bytes of the symbol
    function buyDragoInternal(
        address _targetDrago,
        address _who,
        address _factory,
        uint _value,
        uint _amount,
        bytes _name,
        bytes _symbol)
        internal
    {
        emit BuyDrago(_targetDrago, _who, _factory, _value, _amount, _name, _symbol);
    }

    /// @dev Logs a sale event
    /// @param _who Address of the caller
    /// @param _targetDrago Address of the drago
    /// @param _factory Address of the factory
    /// @param _amount Number of burnt tokens
    /// @param _revenue Value of transaction in wei
    /// @param _name Hex encoded bytes of the name
    /// @param _symbol Hex encoded bytes of the symbol
    function sellDragoInternal(
        address _targetDrago,
        address _who,
        address _factory,
        uint _amount,
        uint _revenue,
        bytes _name,
        bytes _symbol)
        internal
    {
        emit SellDrago(_targetDrago, _who, _factory, _amount, _revenue, _name, _symbol);
    }

    /// @dev Logs a new drago creation by factory
    /// @param _who Address of the caller
    /// @param _newDrago Address of the new drago
    /// @param _factory Address of the factory
    /// @param _name Bytes array of the name
    /// @param _symbol Bytes array of the symbol
    /// @param _dragoId Number of the pool in registry
    function createDragoInternal(
        address _newDrago,
        address _factory,
        address _who,
        uint _dragoId,
        string _name,
        string _symbol)
        internal
    {
        emit DragoCreated(_newDrago, _factory, _who, _dragoId, _name, _symbol);
    }
}

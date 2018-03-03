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

// STILL WORK IN PROGRESS

pragma solidity ^0.4.20;

/// @title Authority Interface - Allows interaction with the Authority contract.
/// @author Gabriele Rigo - <gab@rigoblock.com>
contract Authority {

  // EVENTS

  event SetAuthority (address indexed authority);
  event SetWhitelister (address indexed whitelister);
  event WhitelistedUser(address indexed target, bool approved);
  event WhitelistedAsset(address indexed asset, bool approved);
  event WhitelistedExchange(address indexed exchange, bool approved);
  event WhitelistedRegistry(address indexed registry, bool approved);
  event WhitelistedFactory(address indexed factory, bool approved);
  event WhitelistedVault(address indexed vault, bool approved);
  event WhitelistedDrago(address indexed drago, bool isWhitelisted);
  event NewDragoEventful(address indexed dragoEventful);
  event NewVaultEventful(address indexed exchangeEventful);
  event NewExchangeEventful(address indexed vaultEventful);
  event NewCasper(address indexed casper);

  // CORE FUNCTIONS

  function setAuthority(address _authority, bool _isWhitelisted) public {}
  function setWhitelister(address _whitelister, bool _isWhitelisted) public {}
  function whitelistUser(address _target, bool _isWhitelisted) public {}
  function whitelistAsset(address _asset, bool _isWhitelisted) public {}
  function whitelistExchange(address _exchange, bool _isWhitelisted) public {}
  function whitelistDrago(address _drago, bool _isWhitelisted) public {}
  function whitelistVault(address _vault, bool _isWhitelisted) public {}
  function whitelistRegistry(address _registry, bool _isWhitelisted) public {}
  function whitelistFactory(address _factory, bool _isWhitelisted) public {}
  function setDragoEventful(address _dragoEventful) public {}
  function setVaultEventful(address _vaultEventful) public {}
  function setExchangeEventful(address _exchangeEventful) public {}
  function setExchangeAdapter(address _exchange, address _adapter) public {}
  function setCasper(address _casper) public {}

  function isWhitelistedUser(address _target) public constant returns (bool) {}
  function isWhitelister(address _whitelister) public constant returns (bool) {}
  function isAuthority(address _authority) public constant returns (bool) {}
  function isWhitelistedAsset(address _asset) public constant returns (bool) {}
  function isWhitelistedExchange(address _exchange) public constant returns (bool) {}
  function isWhitelistedRegistry(address _registry) public constant returns (bool) {}
  function isWhitelistedDrago(address _drago) public constant returns (bool) {}
  function isWhitelistedVault(address _vault) public constant returns (bool) {}
  function isWhitelistedFactory(address _factory) public constant returns (bool) {}
  function getDragoEventful() public constant returns (address) {}
  function getVaultEventful() public constant returns (address) {}
  function getExchangeEventful() public constant returns (address) {}
  function getCasper() public constant returns (address) {}
  function getOwner() public constant returns (address) {}
  function getExchangeAdapter(address _exchange) public constant returns (address) {}
  function getListsByGroups(string _group) public constant returns (address[]) {}
}

/// @title Drago Eventful Interface contract.
/// @author Gabriele Rigo - <gab@rigoblock.com>
contract DragoEventfulFace {

  // EVENTS

  event BuyDrago(address indexed drago, address indexed from, address indexed to, uint256 amount, uint256 revenue, bytes name, bytes symbol);
  event SellDrago(address indexed drago, address indexed from, address indexed to, uint256 amount, uint256 revenue, bytes name, bytes symbol);
  event NewNAV(address indexed drago, address indexed from, address indexed to, uint sellPrice, uint buyPrice);
  event DepositExchange(address indexed drago, address indexed exchange, address indexed token, uint value, uint256 amount);
  event WithdrawExchange(address indexed drago, address indexed exchange, address indexed token, uint value, uint256 amount);
  event OrderExchange(address indexed drago, address indexed exchange, address indexed cfd, uint value, uint revenue);
  event TradeExchange(address indexed drago, address indexed exchange, address tokenGet, address tokenGive, uint amountGet, uint amountGive, address get, address give);
  event CancelOrder(address indexed drago, address indexed exchange, address indexed cfd, uint value, uint id);
  event FinalizeDeal(address indexed drago, address indexed exchange, address indexed cfd, uint value, uint id);
  event DragoCreated(address indexed drago, address indexed group, address indexed owner, uint dragoId, string name, string symbol);

  // CORE FUNCTIONS

  function buyDrago(address _who, address _targetDrago, uint _value, uint _amount, bytes _name, bytes _symbol) external returns (bool success) {}
  function sellDrago(address _who, address _targetDrago, uint _amount, uint _revenue, bytes _name, bytes _symbol) external returns(bool success) {}
  function setDragoPrice(address _who, address _targetDrago, uint _sellPrice, uint _buyPrice) external returns(bool success) {}
  function changeRatio(address _who, address _targetDrago, uint256 _ratio) external returns(bool success) {}
  function setTransactionFee(address _who, address _targetDrago, uint _transactionFee) external returns(bool success) {}
  function changeFeeCollector(address _who, address _targetDrago, address _feeCollector) external returns(bool success) {}
  function changeDragoDao(address _who, address _targetDrago, address _dragoDao) external returns(bool success) {}
  function depositToExchange(address _who, address _targetDrago, address _exchange, address _token, uint256 _value) external returns(bool success) {}
  function withdrawFromExchange(address _who, address _targetDrago, address _exchange, address _token, uint256 _value) external returns(bool success) {}
  function placeOrderExchange(address _who, address _targetDrago, address _exchange, address _tokenGet, uint _amountGet, address _tokenGive, uint _amountGive, uint _expires) external returns(bool success) {}
  function placeTradeExchange(address _who, address _targetDrago, address _exchange, address _tokenGet, uint _amountGet, address _tokenGive, uint _amountGive, uint _expires, address _user, uint _amount) external returns(bool success) {}
  function placeOrderCFDExchange(address _who, address _targetDrago, address _cfdExchange, address _cfd, bool _is_stable, uint32 _adjustment, uint128 _stake) external returns(bool success) {}
  function cancelOrderExchange(address _who, address _targetDrago, address _exchange, address _tokenGet, uint _amountGet, address _tokenGive, uint _amountGive, uint _expires) external returns(bool success) {}
  function cancelOrderCFDExchange(address _who, address _targetDrago, address _cfdExchange, address _cfd, uint32 _id) external returns(bool success) {}
  function finalizedDealExchange(address _who, address _targetDrago, address _exchange, address _cfd, uint24 _id) external returns(bool success) {}
  function createDrago(address _who, address _dragoFactory, address _newDrago, string _name, string _symbol, uint _dragoId, address _owner) external returns(bool success) {}
}

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

  event NewNAV(
    address indexed drago,
    address indexed from,
    address indexed to,
    uint sellPrice,
    uint buyPrice
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

  modifier approved_factory_only(address _factory) {
    Authority auth = Authority(AUTHORITY);
    if (auth.isWhitelistedFactory(_factory)) _;

  }

  modifier approved_drago_only(address _drago) {
    Authority auth = Authority(AUTHORITY);
    if (auth.isWhitelistedDrago(_drago)) _;
  }

  modifier approved_exchange_only(address _exchange) {
    Authority auth = Authority(AUTHORITY);
    if (auth.isWhitelistedExchange(_exchange)) _;
  }

  modifier approved_user_only(address _user) {
    Authority auth = Authority(AUTHORITY);
    if (auth.isWhitelistedUser(_user)) _;
  }

  modifier approved_asset(address _asset) {
    Authority auth = Authority(AUTHORITY);
    if (auth.isWhitelistedAsset(_asset)) _;
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
    approved_drago_only(_targetDrago)
    returns (bool success)
  {
    require (msg.sender == _targetDrago);
    BuyDrago(_targetDrago, _who, msg.sender, _value, _amount, _name, _symbol);
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
    approved_drago_only(_targetDrago)
    returns(bool success)
  {
    require(_amount > 0);
    require(msg.sender == _targetDrago);
    SellDrago(_targetDrago, _who, msg.sender, _amount, _revenue, _name, _symbol);
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
    approved_drago_only(_targetDrago)
    returns(bool success)
  {
    require(_sellPrice > 10 finney && _buyPrice > 10 finney);
    require(msg.sender == _targetDrago);
    NewNAV(_targetDrago, msg.sender, _who, _sellPrice, _buyPrice);
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
    approved_drago_only(_targetDrago)
    approved_exchange_only(_exchange)
    returns(bool success)
  {
    require (msg.sender == _targetDrago);
    DepositExchange(_targetDrago, _exchange, _token, _value, 0);
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
    approved_drago_only(_targetDrago)
    approved_exchange_only(_exchange)
    returns(bool success)
  {
    require (_targetDrago != 0);
    require (msg.sender == _targetDrago);
    WithdrawExchange(_targetDrago, _exchange, _token, _value, 0);
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
    approved_drago_only(_targetDrago)
    approved_exchange_only(_exchange)
    returns(bool success)
  {
    require (_targetDrago != 0);
    require (msg.sender == _targetDrago);
    OrderExchange(_targetDrago, _exchange, _tokenGet, _amountGet, 0);
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
    approved_drago_only(_targetDrago)
    approved_exchange_only(_cfdExchange)
    approved_asset(_cfd)
    returns(bool success)
  {
    require (msg.sender == _targetDrago);
    OrderExchange(_targetDrago, _cfdExchange, _cfd, _stake, _adjustment);
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
    approved_drago_only(_targetDrago)
    approved_exchange_only(_exchange)
    returns(bool success)
  {
    require (_targetDrago != 0);
    require (msg.sender == _targetDrago);
    //TradeExchange(_targetDrago, _exchange, _tokenGet, _tokenGive, _amountGet, _amountGive, _user);
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
    approved_drago_only(_targetDrago)
    approved_exchange_only(_exchange)
    returns(bool success)
  {
    require (_targetDrago != 0);
    require (msg.sender == _targetDrago);
    CancelOrder(_targetDrago, _exchange, _tokenGet, _amountGet, 0);
    return true;
  }

  function cancelOrderCFDExchange(
    address _who,
    address _targetDrago,
    address _cfdExchange,
    address _cfd,
    uint32 _id)
    external
    approved_drago_only(_targetDrago)
    approved_exchange_only(_cfdExchange)
    approved_asset(_cfd)
    returns(bool success)
  {
    require (msg.sender == _targetDrago);
    CancelOrder(_targetDrago, _cfdExchange, _cfd, 0,_id);
    return true;
  }

  function finalizeDealCFDExchange(
    address _who,
    address _targetDrago,
    address _cfdExchange,
    address _cfd,
    uint24 _id)
    external
    approved_drago_only(_targetDrago)
    approved_exchange_only(_cfdExchange)
    approved_asset(_cfd)
    returns(bool success)
  {
    require (msg.sender == _targetDrago);
    DealFinalized(_targetDrago, _cfdExchange, _cfd, 0, _id);
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
    approved_drago_only(_targetDrago)
    approved_user_only(_who)
    returns(bool success)
  {
    require (msg.sender == _targetDrago);
    NewFee(_targetDrago, msg.sender, _who, _transactionFee);
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
    approved_drago_only(_targetDrago)
    approved_user_only(_who)
    returns(bool success)
  {
    require (msg.sender == _targetDrago);
    NewCollector(_targetDrago, msg.sender, _who, _feeCollector);
    return true;
  }

  /// @dev Logs a new Drago creation by factory
  /// @param _who Address of the caller
  /// @param _dragoFactory Address of the factory
  /// @param _newDrago Address of the new Drago
  /// @param _name String of the name of the new drago
  /// @param _symbol String of the symbol of the new drago
  /// @param _dragoId Number of the new drago Id
  /// @param _owner Address of the drago wizard
  /// @return Bool the transaction executed successfully
  function createDrago(
    address _who,
    address _dragoFactory,
    address _newDrago,
    string _name,
    string _symbol,
    uint _dragoId,
    address _owner)
    external
    approved_factory_only(_dragoFactory)
    returns(bool success)
  {
    require (msg.sender == _dragoFactory);
    DragoCreated(_newDrago, _dragoFactory, _owner, _dragoId, _name, _symbol);
    return true;
  }
}
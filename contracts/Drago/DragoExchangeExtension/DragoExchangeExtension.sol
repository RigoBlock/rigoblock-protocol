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

import { Authority } from "../../Authority/Authority.sol";

/// @title Drago Exchange Extention - library to extend drago to exchange adapters.
/// @author Gabriele Rigo - <gab@rigoblock.com>
library DragoExchangeExtension {

  struct Admin {
    address authority;
    address dragoDao;
    address feeCollector;
    uint minOrder; // minimum stake to avoid dust clogging things up
    uint ratio; //ratio is 80%
  }

  /// @dev Enables operations with exchanges
  /// @param _exchange Address of the exchange
  function operateOnExchange(Admin memory admin, address _exchange) internal {
    assembleCall(_exchange, msg.data.length);
  }

  /// @dev Allows caller to delegate any call to the selected exchange adapter
  /// @param _exchange Address of the target exchange
  /// @param _callData size of the data of the call
  function assembleCall(address _exchange, uint _callData) internal {
    Admin memory admin;

    uint size = _callData;
    bytes32 m_data = _malloc(size);

    assembly {
      calldatacopy(m_data, 0x0, size)
    }

    bytes32 m_result = _call(m_data, size, _exchange);

    assembly {
      return(m_result, 0x20)
    }
  }

  /// @dev Builds the bytes from the call data
  /// @param size Given size of the call
  /// @return Bytes32 of the pointer
  function _malloc(uint size) internal pure returns(bytes32) {
    bytes32 m_data;

    assembly {
      /// @notice Get free memory pointer and update it
      m_data := mload(0x40)
      mstore(0x40, add(m_data, size))
    }

  return m_data;
  }

  /// @dev Checks whether a call returns something and executes if positive
  /// @param m_data Bytes32 of the call data
  /// @param size Given size of the call
  /// @param adapter Address of the exchange adapter which receives a delegatecall
  /// @return A pointer to memory which contain the 32 first bytes of the delegatecall output
  function _call(bytes32 m_data, uint size, address adapter) internal returns(bytes32) {
    address target = adapter;
    bytes32 m_result = _malloc(32);
    bool failed;

    assembly {
      failed := iszero(delegatecall(sub(gas, 10000), target, m_data, size, m_result, 0x20))
    }

    require(!failed);
    return m_result;
  }
}

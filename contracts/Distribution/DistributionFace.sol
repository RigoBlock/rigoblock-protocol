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

/// @title Distribution Interface - Allows to interact with the distribution.
/// @author Gabriele Rigo - <gab@rigoblock.com>
interface DistributionFace {

    event Subscription(address indexed buyer, address indexed distributor, uint amount);

    function subscribe(address _pool, address _distributor, address _buyer) external payable;
    function setFee(uint _fee, address _distributor) external;
    function getFee(address _distributor) external view returns (uint);
}

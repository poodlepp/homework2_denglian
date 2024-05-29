// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {TransparentUpgradeableProxy} from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract ProxyAdminPri is TransparentUpgradeableProxy {
    constructor(address _logic, address _admin, bytes memory _data) 
        TransparentUpgradeableProxy(_logic, _admin, _data) {
        }
}


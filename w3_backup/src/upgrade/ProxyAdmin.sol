// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {TransparentUpgradeableProxy} from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract ProxyAdmin is Ownable, TransparentUpgradeableProxy {
    constructor(address _logic, address _admin) TransparentUpgradeableProxy(_logic, _admin) {}

    function upgradeTo(address newImplementation) public onlyOwner {
        _upgradeTo(newImplementation);
        // emit Upgraded(newImplementation);
    }
}
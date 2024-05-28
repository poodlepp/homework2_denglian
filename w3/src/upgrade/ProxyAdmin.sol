// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {TransparentUpgradeableProxy} from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract ProxyAdmin is TransparentUpgradeableProxy {
    constructor(address _logic, address _admin) 
        TransparentUpgradeableProxy(_logic, _admin, bytes("0x8129fc1c")) {
        }

    fallback() external payable {
        _fallback(msg.data);
    }

    function upgradeTo(address newLogic) public onlyAdmin {
        _upgradeTo(newLogic);
    }

    modifier onlyAdmin() {
        require(msg.sender == admin(), "Only admin can upgrade");
        _;
    }
}

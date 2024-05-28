// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {MyERC20V1} from "../src/upgrade/MyERC20V1.sol";
import "forge-std/Script.sol";

contract DeployScript is Script{
    function run() public {
        vm.startBroadcast();
        MyERC20V1 implementation = new MyERC20V1();
        vm.stopBroadcast();
        
    }
}
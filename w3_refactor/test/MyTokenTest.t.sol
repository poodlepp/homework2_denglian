// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {MyERC20V1} from "../src/upgrade/MyERC20V1.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol";
import { Upgrades } from "@openzeppelin/foundry-upgrades/Upgrades.sol";

contract MyTokenTest is Test {
    MyERC20V1 myToken;
    ERC1967Proxy proxy;
    address owner;
    address newOwner;

    function setUp() public {
        MyERC20V1 implementation = new MyERC20V1();
        owner = vm.addr(1);
        proxy = new ERC1967Proxy(address(implementation), abi.encodeCall(implementation.initialize,()));
        myToken = MyERC20V1(address(proxy));
        newOwner = address(1);
        emit log_address(owner);
    }

    function testERC20Functionality() public {
        vm.prank(owner);
        myToken.mint(address(2),1000);
        assertEq(myToken.balanceOf(address(2)), 1000);
    }

    function testUpgradeability() public {
        Upgrades.upgradeProxy(address(proxy), "MyERC20V2W4.sol", "", owner);
    }
}


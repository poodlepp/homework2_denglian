// SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

// import { DecentralizedStableCoin } from "../../src/DecentralizedStableCoin.sol";
import {UniswapV2Factory} from "@v2-core/UniswapV2Factory.sol";
import { Test, console } from "forge-std/Test.sol";
import { StdCheats } from "forge-std/StdCheats.sol";

contract DecentralizedStablecoinTest is StdCheats, Test {
    UniswapV2Factory fac;

    function setUp() public {
        fac = new UniswapV2Factory();
    }

    function test01() public {
        
    }
}

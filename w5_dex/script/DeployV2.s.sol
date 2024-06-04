// SPDX-License-Identifier: MIT

pragma solidity 0.5.16;

import {BaseScript} from "./BaseScript.s.sol";
import {UniswapV2Factory} from "@v2-core/UniswapV2Factory.sol";


contract DeployVault is BaseScript {

    function run() public broadcaster {

        UniswapV2Factory d = new UniswapV2Factory();
        saveContract("local", "UniswapV2Factory" , address(d));

        // Bank c = new Bank(address(d));
        // saveContract("local", "Bank" , address(c));

    }
}
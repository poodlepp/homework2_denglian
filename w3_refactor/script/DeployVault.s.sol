// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {BaseScript} from "./BaseScript.s.sol";
import {MyERC20} from "../src/erc20/Pengyi.sol";
import {Vault} from "../src/erc20/Vault.sol";


contract DeployVault is BaseScript {

    function run() public broadcaster {
        MyERC20 c = new MyERC20();

        saveContract("local", "erc20" , address(c));

        Vault d = new Vault();
        saveContract("local", "vault" , address(d));
    }
}
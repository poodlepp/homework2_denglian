// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {BaseScript} from "./BaseScript.s.sol";
import {Bank} from "../src/Bank.sol";
import {ERC2612} from "../src/ERC2612.sol";


contract DeployVault is BaseScript {

    function run() public broadcaster {

        ERC2612 d = new ERC2612();
        saveContract("local", "ERC2612" , address(d));

        Bank c = new Bank(address(d));
        saveContract("local", "Bank" , address(c));

    }
}
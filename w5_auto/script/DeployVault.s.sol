// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {BaseScript} from "./BaseScript.s.sol";
import {Bank} from "../src/Bank.sol";
import {CAMP2Token} from "../src/CAMP2Token.sol";
import {AutoCollectUpKeep} from "../src/AutoCollectUpKeep.sol";


contract DeployVault is BaseScript {

    function run() public broadcaster {

        CAMP2Token d = new CAMP2Token();
        saveContract("local", "CAMP2Token" , address(d));

        Bank c = new Bank(address(d));
        saveContract("local", "Bank" , address(c));

        AutoCollectUpKeep acu = new AutoCollectUpKeep(address(d),address(c));
        saveContract("local", "Bank" , address(acu));
    }
}
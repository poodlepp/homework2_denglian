// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { ERC20Permit } from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20Received} from "./ERC20Received.sol";
import {Address} from "@openzeppelin/contracts/utils/Address.sol";
// import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";


contract MyERC20 is ERC20Permit {
    error MyERC20__TokenTransferFailed();

    uint8 public constant DECIMALS = 18;
    constructor()  ERC20(unicode"我的名字", "PENGYI") ERC20Permit("what") {
        _mint(msg.sender, 10000 * 10 ** DECIMALS);
    }

    /**
     * method 2
     */
    function transfer(address to, uint256 amount) public override returns (bool success) {
        _transfer(msg.sender, to, amount);
        uint32 size;
        assembly {
            size := extcodesize(to)
        }

        if(size > 0) {
            bool rv = ERC20Received(to).tokensReceived(msg.sender, amount);
            if(!rv) {
                revert MyERC20__TokenTransferFailed();
            }
        }
        success = true;
    }
}
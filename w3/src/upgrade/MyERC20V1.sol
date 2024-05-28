// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {ERC20Received} from "../erc20/ERC20Received.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import {ERC20Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
contract MyERC20V1 is ERC20Upgradeable{
    function initialize() external initializer {
        __ERC20_init("MyERC20V1", "M1");
        _mint(msg.sender, 1000000 * 10 ** uint256(decimals()));
    }
    
}

contract sig {
    string public name;

    function setName(string calldata str) external {
        name = str;
    }
    function test() public pure returns(bytes memory) {
        return abi.encodeWithSignature("initialize()");
    }
}

contract MyERC20V2 is ERC20Upgradeable{
    error MyERC20V2__TokenTransferFailed();
    // function initialize() external initializer {
    // }

    function transferWithCallback(address to, uint256 amount) public payable returns (bool success) {
         _transfer(msg.sender, to, amount);
        uint32 size;
        assembly {
            size := extcodesize(to)
        }

        if(size > 0) {
            bool rv = ERC20Received(to).tokensReceived(msg.sender, amount);
            if(!rv) {
                revert MyERC20V2__TokenTransferFailed();
            }
        }
        success = true;
    }
}
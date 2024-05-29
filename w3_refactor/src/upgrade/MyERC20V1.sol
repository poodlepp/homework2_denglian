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
    
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}

// contract sig {
//     string public name;

//     function setName(string calldata str) external {
//         name = str;
//     }
//     function encodeSig() public pure returns(bytes memory) {
//         return abi.encodeWithSignature("initialize()");
//     }
// }

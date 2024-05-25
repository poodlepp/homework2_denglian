// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {ERC721URIStorage} from  "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Counter} from "./Counter.sol";

contract MyERC721 is ERC721URIStorage, Counter {
    // using Counter for Counter;
    // Counter.number private _tokenIds;

    constructor() ERC721(unicode"我的名字", "PENGYI") {}

    function mint(address student, string memory tokenURI) public returns (uint256) {
        uint256 newItemId = number;
        _mint(student, newItemId);
        _setTokenURI(newItemId, tokenURI);
        increment();
        return newItemId;
    } 

}
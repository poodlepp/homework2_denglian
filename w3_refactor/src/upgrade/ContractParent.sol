// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

contract ContractParent {
    string public str;

    constructor() {}

    function add(string memory ss) external returns (string memory rs) {
        str = concatenateStrings(str, ss);
        rs = str;
    }

    function concatenateStrings(string memory a, string memory b) public pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }
}

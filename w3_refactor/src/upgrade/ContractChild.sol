// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import "./ContractParent.sol";

contract ContractChild is ContractParent{
    // string public str;
    constructor(string memory init) ContractParent() {
        str = init;
    }

    function add2(string memory chan) external returns (string memory rs) {
        str = concatenateStrings(str, chan);
        rs = str;
    }
}

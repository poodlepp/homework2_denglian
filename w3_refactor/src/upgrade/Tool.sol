// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;


contract Tool {
    function getData() external pure returns (bytes memory data) {
        data = abi.encodeWithSignature("upgradeToAndCall(address,bytes)",address(0xc88e40Cd8433ae60e26dc3291fA7219e66ea180f),bytes("0x8129fc1c"));
    }
}
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

interface ERC20Received {
    function tokensReceived(address, uint256) external returns (bool success);
}
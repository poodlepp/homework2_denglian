// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ERC20Received} from "./ERC20Received.sol";
import { IERC20Permit } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Permit.sol";

contract Vault is ERC20Received{
    error Vault__AmountShouldNotLessThanZero();
    error Vault__BalanceNotEnough();
    error Vault__DepositError();
    error Vault__WithdrawError();

    mapping(address token => mapping(address => uint256)) private balances;

    modifier amountCheck(uint256 amount) {
        if ( amount <= 0) {
            revert Vault__AmountShouldNotLessThanZero();
        }
        _;
    }



    constructor() {

    }
    /**
     * method 1 
     * approve + deposit(transferFrom)
     * 两笔交易
     */

    function deposit(address token, uint256 amount) 
        public amountCheck(amount) returns (bool success) {
        // IERC20(token).transferFrom(msg.sender,address(this),amount);
        SafeERC20.safeTransferFrom(IERC20(token),msg.sender,address(this),amount);
        balances[token][msg.sender] += amount;
        return true;
    }

    /**
     * method 2
     * tokenReceived  (也可以用erc777实现，不过777现在已经废弃了)
     * user - erc - vault
     * 一笔交易
     * 
     * 实现方法在token合约中
     */

    function tokensReceived(address from, uint256 amount) external returns (bool success) {
        // 应该由owner来控制 允许的token范围，不能完全放开
        balances[msg.sender][from] += amount;
        return true;
    }

    /**
     * method 3
     * permit   这个就是EIP2612
     * 还有更高级的permit2
     * 貌似无法手动构造  因为涉及msg.sender 的nonce； 用vm cheatcode 也许可以
     * 目前这个方法还不支持第三方进行调用，只支持用户自身操作
     */
    function depositPermit(
        address token,
        uint256 amount,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (bool success){
        IERC20Permit(token).permit(
            msg.sender,
            address(this),
            amount,
            deadline,
            v,
            r,
            s
        );
        bool rv = deposit(token,amount);
        // bool rv = IERC20(token).transferFrom(owner, spender,value);
        if (!rv) {
            revert Vault__DepositError();
        }
        return true;
    }


    function withdraw(address token, uint256 amount) external amountCheck(amount) returns (bool success) {
        if(balances[token][msg.sender] < amount) {
            revert Vault__BalanceNotEnough();
        }
        bool rv = IERC20(token).transfer(msg.sender,amount);
        if(!rv) {
            revert Vault__WithdrawError();
        }
        return true;
    }

    function balanceOf(address token) external view returns (uint256 amount) {
        return balances[token][msg.sender];
    }

}
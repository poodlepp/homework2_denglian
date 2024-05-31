// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NFTMarket is IERC721Receiver {
    error NFTMarket__TokenNotBelongsToU();
    error NFTMarket__TokenIsNotForSale();
    error NFTMarket__BalanceNotEnough();
    error NFTMarket__TokenIsNotExpected();

    mapping(uint256 tokenId => uint256 price) public sales;
    mapping(uint256 tokenId => address saler) public salers;
    address public immutable token;
    address public immutable nft;

    constructor(address token_, address nft_) {
        token = token_;
        nft = nft_;
    }

    function list(uint256 tokenId, uint256 amount) public returns (bool success) {
        if(msg.sender != IERC721(nft).ownerOf(tokenId)) {
            revert NFTMarket__TokenNotBelongsToU();
        }
        sales[tokenId] = amount;
        salers[tokenId] = msg.sender;
        //质押，此种方式需要提前approve； 也就是两笔交易,所以更推荐下面的received
        IERC721(nft).transferFrom(msg.sender,address(this),tokenId);
        return true;
    }

    function buy(uint256 tokenId) public returns (bool success) {
        if(sales[tokenId] < 0) {
            revert NFTMarket__TokenIsNotForSale();
        }

        if(IERC20(token).balanceOf(msg.sender) < sales[tokenId]) {
            revert NFTMarket__BalanceNotEnough();
        }
        // 需要先授权这个比较麻烦
        IERC20(token).transferFrom(msg.sender,salers[tokenId],sales[tokenId]);
        IERC721(nft).transferFrom(address(this),msg.sender,tokenId);
        sales[tokenId] = 0;
        salers[tokenId] = address(0);
        return true;
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external pure returns (bytes4) {
        // if(operator != nft) {
        //     revert NFTMarket__TokenIsNotExpected();
        // }
        // uint256 price = abi.decode(data,(uint256));
        // sales[tokenId] = price;
        // salers[tokenId] = from;
        return this.onERC721Received.selector;
    }
}
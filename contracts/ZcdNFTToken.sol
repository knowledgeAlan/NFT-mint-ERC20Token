// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ZcdNFTToken is ERC721, Ownable {
    uint256 private _nextTokenId;
    
    IERC20 public tokenAddress;
    
    uint256 public rate = 100 * 10 ** 18;


    constructor(address _tokenAddress)
        ERC721("ZCDNFT", "ZCDN")
        Ownable(msg.sender)
    {
        tokenAddress = IERC20(_tokenAddress);
    }

    function safeMint() public onlyOwner {
        tokenAddress.transferFrom(msg.sender,address(this),rate);
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
    }

    function withdrawToken() public onlyOwner {
        tokenAddress.transfer(msg.sender,tokenAddress.balanceOf(address(this)));
    }
}
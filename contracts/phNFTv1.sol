// SPDX-License-Identifier: MIT


pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";



contract phNFTv1 is ERC721 {
    string private baseURI;

    constructor(string memory name, string memory symbol, string memory baseURI_) ERC721(name, symbol) {
        baseURI = baseURI_;

    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function mint(address to, uint256 tokenId) public {
        _safeMint(to, tokenId);
    }

   function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(ownerOf(tokenId) != address(0), "ERC721Metadata: URI query for nonexistent token");
        return string(abi.encodePacked(_baseURI(), Strings.toString(tokenId), ".json"));
    }

  

}


// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import "@openzeppelin/contracts/access/Ownable.sol";
import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract HonoraryWeaxels is Ownable, ERC721A {

    string public CONTRACT_URI;
    string public BASE_URI;

    constructor() ERC721A("HonoraryWeaxels", "HWXL") {}

    function contractURI() public view returns (string memory) {
        return CONTRACT_URI;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        return string(abi.encodePacked(BASE_URI, "/", Strings.toString(_tokenId)));
    }

    function mint(uint256 quantity, address receiver) public onlyOwner {
        _safeMint(receiver, quantity);
    }

    function setContractURI(string memory _contractURI) public onlyOwner {
        CONTRACT_URI = _contractURI;
    }

    function setBaseURI(string memory _baseURI) public onlyOwner {
        BASE_URI = _baseURI;
    }
}
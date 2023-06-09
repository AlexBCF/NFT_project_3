//SPDX_License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract NFT is ERC721Enumerable, Ownable {
    // int=> string
    using Strings for uint256;
    uint256 maxSupply = 8;
    uint256 cost = 0.001 ether; //0.001 BNB
    string baseURI = "ipfs://QmR4Hd6wUpJXpwrb6iRtEqKL41kYBXrTvb7kbF6Hr2g3V1/";

    //server
    //IPFS
    //onchain


    constructor() ERC721("HumanCrypto","HC") {}

    function _baseUri() internal view returns (string memory) {
        return baseURI;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory){
        _requireMinted(tokenId);
        return 
            bytes(baseURI).length > 0 
                ? string(abi.encodePacked(baseURI, tokenId.toString(), ".json"))
                : "";
    }
    function changeBaseURI(string memory _newBaseURI) public onlyOwner{
        baseURI = _newBaseURI;
    }

    function safeMint(address _to) public payable{
        uint256 _currentSupply = totalSupply();
        require(_currentSupply<maxSupply, "You reached max supply");
        require(msg.value == cost, "Please add valid amount in BNB");
        _safeMint(_to, _currentSupply);
    }

    function withdraw() public onlyOwner{
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success);
        
    }
}




// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNftToken is ERC721URIStorage{

    uint256 private tokenCounter;

    constructor() ERC721("MyNftToken", "MNFT") {tokenCounter = 0;}

    function mintNft(address to,string memory tokenUri) public returns (uint256){
        uint256 tokenId = tokenCounter;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId,tokenUri);
        tokenCounter++;
        return tokenId;
    }
    
    // tokenUri : "https://harlequin-adorable-tarantula-718.mypinata.cloud/ipfs/bafkreig2lr634uhvevvtvlw5ohnxiuvvnavnvj7mjodzllhedgcobtpcfe"

    
}
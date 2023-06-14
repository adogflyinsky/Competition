// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract CompetitionToken is ERC721Enumerable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdTracker;
    string private _url;

    event Mint(address to,uint256 id);

    constructor(string memory url) ERC721("Competition Token ", "CT") {
        _url = url;
    }

    function _baseURI()
        internal
        view
        override
        returns (string memory _newBaseURI)
    {
        return _url;
    }

    function mintTo(address to) external returns (uint256) {
        _tokenIdTracker.increment();    
        uint256 id = _tokenIdTracker.current();
        _mint(to, id);
        emit Mint(to,id);
        return id;
    }

    function listTokenIds(address owner)external view returns (uint256[] memory){
        uint balance = balanceOf(owner);
        uint256[] memory ids = new uint256[](balance);
        for( uint i = 0;i < balance; i++)
        {
            ids[i]=tokenOfOwnerByIndex(owner,i);
        }
        return ids;
    }
}

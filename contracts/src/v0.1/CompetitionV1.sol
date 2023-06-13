// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "./CompetitionV0.sol";
import "./interfaces/IPrize.sol";
import "./interfaces/IQuestionSet.sol";

contract CompetitionV1 is CompetitionV0 {
    constructor(IERC721 _competitionToken, address _prizeAddress, IQuestionSet _questions) 
    CompetitionV0(_competitionToken, _prizeAddress, _questions)
    {}  
    
    function fillResult(uint256 id, string memory result) external {
        uint256 index = trackingCompetition[id];
        require(msg.sender == competitions[index].owner, "You are not owner of the id");
        _fillResult(id, result);
    } 

}
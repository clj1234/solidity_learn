// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting{
    mapping ( uint => uint256 ) private voteMap;
    uint[] private voteUserId;

    function vote(uint userId ,uint voteNum) public {
        if(voteMap[userId] <= 0){
            voteUserId.push(userId);
        }
        voteMap[userId] = voteMap[userId] + voteNum;
    }

    function getVotes(uint userId) public view returns(uint256){
        return voteMap[userId];
    }

    function resetVotes() public {
        for (uint256 i = 0; i< voteUserId.length; i++) {
            voteMap[voteUserId[i]] = 0;
        }
    }

}
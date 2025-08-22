// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/access/Ownable.sol";


// Sepolia合约地址：0x599BC5fB4F6bDc016982424c96A9D0cb6ACD997d
// https://sepolia.etherscan.io/address/0x599bc5fb4f6bdc016982424c96a9d0cb6acd997d#events
contract BeggingContract is Ownable {
    constructor() Ownable(msg.sender) {}
    mapping (address => uint) donateCountMap;

    event donation(address indexed donateAddress,uint indexed amount);

    function donate() public payable {
        donateCountMap[msg.sender] += msg.value;
        emit donation(msg.sender, msg.value);
    }

    function getDonation(address _address) public view returns (uint) {
        return donateCountMap[_address];
    }

    function withdraw(address payable to,uint amount) public onlyOwner{
        // payable(owner()).transfer(address(this).balance);
        (bool success,) = to.call{value: amount}("");
        require(success,"Withdraw failed");
    }
}
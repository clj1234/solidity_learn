// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/access/Ownable.sol";

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

    // denate: https://sepolia.etherscan.io/tx/0x928e426b0d81ecc6f9e449deaec1afa61e20790b029fd350b61ab554b9b5e244
    // getDonate:
}
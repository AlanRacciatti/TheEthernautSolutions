// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract King {
    address payable king;
    uint256 public prize;
    address payable public owner;

    constructor() public payable {
        owner = msg.sender;
        king = address(4); // Random address because foundry don't have msg.sender on constructor
        prize = msg.value;
    }

    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        king.transfer(msg.value);
        king = msg.sender;
        prize = msg.value;
    }

    function _king() public view returns (address payable) {
        return king;
    }
}

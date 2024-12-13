// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ENS {
    mapping(address => string) users; 

    constructor() {}

    function signUp(string memory userName) public {
        users[msg.sender] = userName;
    }

    function getUser() public view returns (string memory) {
        return users[msg.sender];
    }

}
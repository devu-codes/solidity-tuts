// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Modifier {
    // Memory 
    function addStrings(string memory a, string memory b) public pure returns (string memory) {
        string memory result = string(abi.encodePacked(a,b));
        return result; 
    }
}
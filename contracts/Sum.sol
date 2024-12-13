// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.2;

contract Calculator {
    uint num = 0;
    uint num2 = 0;
    constructor (uint _num) {
        num = _num; 
    }

    function add(uint _value) public {
        num += _value; 
    }

    function getValue() public view returns (uint) {
        return num; 
    }

    function tempFunc(uint a, uint b) public pure returns (uint) {
        return (a + b); 
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IStorage  {
    function getNum() external view returns(uint);
    function add() external;
}

contract Contract2 {
    constructor() {

    }

    function proxyAdd() public {
        // contract address of Storage Contract
        IStorage(0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3).add(); 
    }

    function proxyGet() public view returns (uint) {
        uint value = IStorage(0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3).getNum();
        return value; 
    }
}
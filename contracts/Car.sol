// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Vehicle.sol";

contract Car is Vehicle {
    uint public numberOfDoors; 

    // Constructor that also initializes the parent contract 
    constructor(string memory _brand, uint _numberOfDoors) Vehicle (_brand){
        numberOfDoors = _numberOfDoors;
    }

    // Override the description function 
    function description() public pure override returns (string memory) {
        return "This is a car";
    }
}

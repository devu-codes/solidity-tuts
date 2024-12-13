// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Money {
    uint public totalMoney;
    function deposit() public payable {
        totalMoney += msg.value;
    }

    function drain(address payable ad) public {
        payable(ad).transfer(totalMoney);
        totalMoney = 0;
    }

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FixedArray {
    uint[3] public numbers; 

    function setNumbers(uint _num1, uint _num2, uint _num3) public {
        numbers[0] = _num1;
        numbers[1] = _num2;
        numbers[2] = _num3;
    }

    function getNumber(uint index) public view returns (uint) {
        require(index < 3);
        return numbers[index]; 
    }
}

contract DynamicArray {
    uint[] public numbers;

    function addNumber(uint _number) public {
        numbers.push(_number);
    }

    function getNumbersCount() public view returns (uint) {
        return numbers.length;
    }

}
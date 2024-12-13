// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract MyToken {
    address public owner; 
    uint public supply = 0; 
    mapping (address => uint) public balances;

    mapping (address => mapping(address => uint)) public allowances; 

    uint decimals = 6; // 11.222222

    string public name = "MyToken";
    string public symbol = "MTK";

    constructor() {
        owner = msg.sender;
    }

    function approve(address _spender, uint256 _value) public returns (bool success){
        allowances[msg.sender][_spender] = _value;
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        uint allowance = allowances[_from][msg.sender];
        require(allowance >= _value);

        uint balance = balances[_from];
        require(balance >= _value);

        balances[_from] -= _value;
        balances[_to] += _value;
        allowances[_from][msg.sender] -= _value;
    }

    // mint 
    function mint(uint amount) public {
        require(owner == msg.sender);
        balances[owner] += amount;
        supply += amount;
    }

    //mintTo
    function mintTo(uint amount, address to) public {
        require(owner == msg.sender);
        balances[to] += amount;
        supply += amount;
    }

    // transfer 
    function transfer(uint amount, address to) public {
        uint existingBalance = balances[msg.sender];
        require(existingBalance >= amount);
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
    
    function burn(uint amount) public {
        uint balance = balances[msg.sender];
        require(balance >= amount);
        balances[msg.sender] -= amount; 
        supply -= amount;
    }
}

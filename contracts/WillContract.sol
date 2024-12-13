// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WillContract {
    // Contract 
    // Every user will deploy their own will contract
    // When Initialized, set the owner to be person initializing
    // The owner can define a recepient in the constructor 
    // Owner should be allowed to chanege the recepient 
    // Owenr should be allowed to interact with contract via ping function
    // If ping hasnt been called > 1 year, rcepient should be allwowed to call a drain function
    
    address private owner;
    address public recepient;
    uint256 public lastPing; 

    constructor (address _recepient) {
        owner = msg.sender;
        recepient = _recepient;
        lastPing = block.timestamp;
    }

    modifier onlyOwner() {
        require (msg.sender == owner, "Only the owner can do this.");
        _;
    }

    function changeRecepient(address _newRecepient) external onlyOwner {
        recepient = _newRecepient;
    }

    function ping() external onlyOwner {
        lastPing = block.timestamp;
    }

    function drain() external {
        require(msg.sender == recepient);
        require(block.timestamp > lastPing + 365 days);

        payable(recepient).transfer(address(this).balance);
    }

    receive() external payable { }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


//objective :
// Gain more tokens than 20 tokens (intial tokens)
contract Token {
    mapping(address => uint256) balances;
    uint256 public totalSupply;

    constructor(uint256 _initialSupply) public {
        balances[msg.sender] = totalSupply = _initialSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        // @audit-issue : vulnerable to arithmetic underflow
        // @audit-info  : we start with 20 tokens
        require(balances[msg.sender] - _value >= 0); // bcz of underflow it wraps it to huge number and the condition is passed even though we haven't enough balance
        balances[msg.sender] -= _value;   // underflow happens and account balance sets to huge number
        balances[_to] += _value; 
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
}
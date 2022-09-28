//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

contract AfaCollector{
    address public owner;
    uint256 public balance;
    constructor(){
        owner=msg.sender;
    }
    receive() payable external {
        balance+=msg.value;
    }
    function withdraw(uint amount, address payable destination)public{
        require(msg.sender==owner,"Only owner can withdraw");
        require(amount<=balance,"Insufficient funds");
        destination.transfer(amount);
        balance -=amount;
    }
}

//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

contract Collector{
//variables to keep information
    address public owner;
    uint256 public balance;
    //initialize owner variable
    constructor(){
        owner=msg.sender;
    }
    //get some funds to the account
    receive() payable external {
        balance+=msg.value;
    }
    //send some ether with security features
    function withdraw(uint amount, address payable destination)public{
        require(msg.sender==owner,"Only owner can withdraw");
        require(amount<=balance,"Insufficient funds");
        destination.transfer(amount);
        balance -=amount;
    }
}

//SPDX-License-Identifier: MIT

pragma solidity ^0.4.8;

contract Fundraiser{
    
    mapping  (address => uint) balances;
    
    function contribute() payable{
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(){
       
        uint balance = balances[msg.sender];
        if(balances[msg.sender] == 0){
            throw;
        }
        balances[msg.sender] = 0;
        msg.sender.call.value(balance)();
        //balances[msg.sender] = 0;
    }
    
    function getFunds() returns (uint){
        return address(this).balance;
    }
    
}
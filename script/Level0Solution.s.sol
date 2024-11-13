// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import{Instance} from "../src//Level0.sol";
import{Script,console} from "forge-std/Script.sol";

contract Level0Solution is Script{
    Instance public level0=Instance(0xF6bdA81cb3eFB49B947CDB93029f508026567239);
    function run() public{
        string memory password=level0.password();
        console.log("password:",password);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        level0.authenticate(password);
        vm.stopBroadcast(); 
    }
}
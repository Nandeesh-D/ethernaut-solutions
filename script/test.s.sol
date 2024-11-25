// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";
contract Sample {
    function call1() external {
            console.log("sample address",address(this));
            console.log("call1 msg.sender",msg.sender);
            (bool success,)=address(this).call(abi.encodeWithSignature("call2()"));
    }

    function call2() public view{
            console.log("call2 msg.sender",msg.sender);
    }
}


contract Engine is Script{
            function run() external{
                   vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
                    console.log("engine address",address(this));
                    Sample s=new Sample();
                    s.call1();
                   vm.stopBroadcast();
            }
}


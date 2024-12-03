// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/** Objective: Сan you get the item from the shop for less than the price asked? */
interface Buyer {
    function price() external view returns (uint256);
}

contract Shop {
    uint256 public price = 100;
    bool public isSold;

    function buy() public {
        Buyer _buyer = Buyer(msg.sender);

        if (_buyer.price() >= price && !isSold) {   //during 1st call the price returned is 101 
            isSold = true;
            price = _buyer.price();    //during second call price returned is 1
        }
    }
}
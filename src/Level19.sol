// // SPDX-License-Identifier: MIT
// pragma solidity ^0.7.0;

// import "../helpers/Ownable-05.sol";

// /** Objective:  You've uncovered an Alien contract. Claim ownership to complete the level. */
// contract AlienCodex is Ownable {
//     bool public contact;
//     bytes32[] public codex;

//     modifier contacted() {
//         assert(contact);
//         _;
//     }

//     function makeContact() public {
//         contact = true;
//     }

//     function record(bytes32 _content) public contacted {
//         codex.push(_content);
//     }

//     function retract() public contacted {
//         codex.length--;
//     }

//     function revise(uint256 i, bytes32 _content) public contacted {
//         codex[i] = _content;
//     }
// }
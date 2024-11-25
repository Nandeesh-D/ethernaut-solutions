// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


/** Objective:
 *        To unlock the privacy contract  (locked=false)
 */
contract Privacy {
    bool public locked = true;     // slot 0
    uint256 public ID = block.timestamp; //slot 1
    uint8 private flattening = 10;   //slot2
    uint8 private denomination = 255; //slot2
    uint16 private awkwardness = uint16(block.timestamp); //slot2
    bytes32[3] private data;   //slot 3-5

    constructor(bytes32[3] memory _data) {
        data = _data;
    }

    function unlock(bytes16 _key) public {
        require(_key == bytes16(data[2]));   //so, data[2] is stored in slot 5
        locked = false;
    }

    /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
    */
}
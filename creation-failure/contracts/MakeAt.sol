//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MakeAt {
  function run() public returns (Dummy) {
    return new Dummy{salt: 0x0000000000000000000000000000000000000000000000000000000000000000}();
  }
}

contract Dummy {
}

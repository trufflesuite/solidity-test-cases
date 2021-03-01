//SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract StorageTest {
  uint x = 1;

  function set(uint _x) public {
    x = _x;
  }
}

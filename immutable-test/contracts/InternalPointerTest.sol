//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract InternalPointerTest {

  int8 immutable minus = -1;
  function() internal immutable handle;

  constructor() {
    handle = doStuff;
  }

  function doStuff() public pure {
  }
}

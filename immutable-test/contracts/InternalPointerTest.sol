//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract InternalPointerTest {

  int8 immutable minus = -1;
  function() internal immutable handle = dummy;

  event Num(int8);

  constructor() {
  }

  function doStuff() public {
    emit Num(minus);
    handle();
  }

  function dummy() public {
  }
}

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Base {
  uint immutable x;
  constructor() {
    x = 1;
  }
}

contract Derived is Base {
  uint immutable y;
  event Pair(uint,uint);
  event Ready();
  constructor() {
    y = 2;
    emit Ready();
  }
  function run() public {
    emit Pair(x,y);
  }
}

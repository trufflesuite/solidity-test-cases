pragma solidity ^0.6.5;

contract Base {
  uint immutable x;
  constructor() public {
    x = 1;
  }
}

contract Derived is Base {
  uint immutable y;
  event Pair(uint,uint);
  event Ready();
  constructor() public {
    y = 2;
    emit Ready();
  }
  function run() public {
    emit Pair(x,y);
  }
}

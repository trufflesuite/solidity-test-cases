pragma solidity ^0.5.10;

contract Base {
  uint x;
  uint y;

  constructor() public {
    x = 107;
  }
}

contract Derived is Base {
  int x;
  constructor() public {
    Base.x = 3;
    x = 683;
    y = 2049;
  }
}

contract HasInitializers {
  uint x = 1;
  uint y;

  constructor() public {
    y = 2;
  }
}

contract OnlyInitializers {
  uint x = 1;
  uint y = 1;
}

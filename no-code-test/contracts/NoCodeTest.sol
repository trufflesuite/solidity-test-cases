pragma solidity ^0.5.1;

contract NoCodeTest {
  Inner x;
  function run() public {
    x = new Inner();
  }
}

contract Inner {
  uint y;
  uint z;
  constructor() public {
    y = 2;
    z = 3;
  }
  function run() public {
    y = 7;
    z = 8;
  }
}

/*
contract HasCodeTest {
  Inner x;
  function run() public {
    x = new Inner();
    x.run();
  }
}
*/

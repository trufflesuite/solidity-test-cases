//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VizBugTest {

  uint x = f();
  Subordinate y = new Subordinate();
  uint z;
  Subordinate w;

  constructor() {
    z = f();
    w = new Subordinate();
  }

  function f() public pure returns (uint) {
    return 3;
  }
}

contract Subordinate {
}

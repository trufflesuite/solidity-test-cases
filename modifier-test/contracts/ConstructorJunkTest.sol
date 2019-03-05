pragma solidity ^0.5.4;

contract Base {

  uint it;

  constructor(uint x) public {
    it = x;
  }
}

contract DerivedConstant is Base(7) {

  uint other;

  constructor() public {
    other = 9;
  }

}

contract DerivedVariable is Base {

  uint other;

  constructor(uint x) Base(x * 2) public {
    other = x * 3;
  }
}

contract ConstructorJunkTest {

  Base dc;
  Base dv;

  function run() public {
    dc = new DerivedConstant();
    dv = new DerivedVariable(6);
  }
}

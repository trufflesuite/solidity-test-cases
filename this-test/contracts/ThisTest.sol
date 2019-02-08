pragma solidity ~0.5;

contract Tester {

  ThisTest nonself;

  function run() public {
    nonself = new ThisTest();
  }
}

contract ThisTest {

  ThisTest public self;

  constructor() public {
    self = this;
  }

}

pragma solidity ^0.5.7;

contract NestedException {
  function run() public {
    this.run2();
  }

  function run2() external {
    new DefinitelyCantCreate();
  }
}

contract DefinitelyCantCreate {
  constructor() public {
    assert(false);
  }
}

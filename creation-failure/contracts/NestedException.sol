//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedException {
  function run() public {
    this.run2();
  }

  function run2() external {
    try new DefinitelyCantCreate() {
    } catch (bytes memory) {
    }
  }
}

contract DefinitelyCantCreate {
  constructor() {
    assert(false);
  }
}

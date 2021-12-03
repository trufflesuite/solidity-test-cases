//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DebugRevertTest {
  function run() public returns (uint) {
    Disposable container = new Disposable();
    return container.get();
  }
}

contract Disposable {
  function get() public returns (uint) {
    selfdestruct(payable(this));
  }

  receive() external payable {
  }
}

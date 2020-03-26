pragma solidity ^0.6.3;

contract DebugRevertTest {
  function run() public returns (uint) {
    Disposable container = new Disposable();
    return container.get();
  }
}

contract Disposable {
  function get() public returns (uint) {
    selfdestruct(address(this));
  }

  receive() external payable {
  }
}

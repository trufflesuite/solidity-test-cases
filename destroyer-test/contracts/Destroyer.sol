pragma solidity ^0.6.0;

contract Destroyer {
  function accept() public payable {
  }

  function destroy() public {
    selfdestruct(address(this));
  }

  receive() external payable {
  }
}

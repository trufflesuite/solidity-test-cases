pragma solidity ^0.5.9;

contract RevertEvent {

  event Hiiii();

  function run() public {
    emit Hiiii();
    revert("nope");
  }
}

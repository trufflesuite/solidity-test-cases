pragma solidity ^0.5.7;

contract InvalidTest {
  
  function() external invalid;

  function run() public {
    invalid = Other(address(this)).example;
  }
}

contract Other {

  event Done();

  function example() public {
    emit Done();
  }
}

pragma solidity ^0.4.25;

contract ShadowTest {

  function run()
  {
  }

  function run(uint8 x) returns (uint8)
  {
    return x;
  }

  function send() returns (uint8)
  {
    return 107;
  }

  function send(uint256 amount) returns (bool)
  {
    return amount == 0;
  }

}

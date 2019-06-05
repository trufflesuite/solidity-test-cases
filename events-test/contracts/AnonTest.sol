pragma solidity ^0.5.9;

contract AnonTest {

  uint x;

  function ext(uint, uint y) public {
    x = y;
  }

  constructor(uint, uint y) public {
    x = y;
  }
}

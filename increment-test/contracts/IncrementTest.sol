pragma solidity ^0.5.4;

contract IncrementTest {
  uint counter;

  event Incremented();

  function increment() public {
    uint x;
    x = counter;
    x++;
    counter = x;
    emit Incremented();
  }
}

pragma solidity ^0.4.22;

contract SillyTest {
  
  event Done();

  struct Silly1 {
    int x;
    uint[0] silly;
    int y;
  }

  struct Null {
  }

  struct Silly2 {
    int x;
    Null silly;
    int y;
  }

  function run() public {
    Silly1 memory silly1;
    silly1.x = -1;
    silly1.y = -1;
    Silly2 memory silly2;
    silly2.x = -1;
    silly2.y = -1;
    emit Done();
  }
}

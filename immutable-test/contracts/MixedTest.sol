pragma solidity ^0.6.5;

contract MixedTest {
  int8 x1 = -1;
  int8 constant x2 = -2;
  int8 immutable x3 = -3;
  int8 x4 = -4;
  int8 constant x5 = -5;
  int8 immutable x6 = -6;

  event Sum(int8);
  event Done();

  constructor() public {
    emit Done();
  }

  function run() public {
    emit Sum(x1 + x3 + x6);
    emit Done();
  }
}

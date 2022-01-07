//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StackTest {

  event Num(uint);

  function doStuff() public {
    uint x = 1;
    uint y = 2;
    uint z = 3;
    emit Num(z);
    emit Num(x);
    emit Num(y);
    emit Num(x + y);
    emit Num(88);
  }
}

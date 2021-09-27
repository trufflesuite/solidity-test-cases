//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract DefaultTest {
  int8 immutable x1 = -3;
  int8 immutable x2 = -6;

  event Int(int8);

  function run() public {
    emit Int(x1);
    emit Int(x2);
  }
}

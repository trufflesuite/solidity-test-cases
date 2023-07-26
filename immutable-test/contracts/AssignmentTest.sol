//SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract AssignmentTest {

  int8 immutable byte1;
  int8 immutable byte2;
  int8 immutable byte3;

  constructor() {
    byte1 = -1;
    byte2 = -2;
    byte3 = byte1 + byte2;
    byte1 = -4;
    emit Int8(byte2);
  }

  event Int8(int8);

  function run() public {
    emit Int8(byte1 + byte2 + byte3);
  }
}

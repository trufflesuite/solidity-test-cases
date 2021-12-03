//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract OtherTests {
  type MyInt is int8;

  event Done();

  function run() public returns (MyInt[2] memory it) {
    it = [MyInt.wrap(-1), MyInt.wrap(-2)];
    emit Done();
  }
}

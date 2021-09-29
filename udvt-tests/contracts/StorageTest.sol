//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract StorageTest {
  type MyInt is int8;
  MyInt first;
  MyInt second;
  MyInt immutable third = MyInt.wrap(-3);

  event Done(int8);

  function run() public {
    first = MyInt.wrap(-1);
    second = MyInt.wrap(-2);
    emit Done(MyInt.unwrap(third));
  }

  function take(MyInt x) public {
    emit Done(MyInt.unwrap(x));
  }
}

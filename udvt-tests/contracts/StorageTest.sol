//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract StorageTest {
  type MyInt is int8;
  MyInt first;
  MyInt second;
  MyInt immutable third = MyInt.wrap(-3);
  MyInt[] arr;
  MyInt[2] staticArr;

  event Done(int8);

  function run() public {
    first = MyInt.wrap(-1);
    second = MyInt.wrap(-2);
    arr.push(MyInt.wrap(-4));
    arr.push(MyInt.wrap(-5));
    arr.push(MyInt.wrap(-6));
    staticArr = [MyInt.wrap(-7), MyInt.wrap(-8)];
    emit Done(MyInt.unwrap(third));
  }

  function take(MyInt x) public {
    emit Done(MyInt.unwrap(x));
  }
}

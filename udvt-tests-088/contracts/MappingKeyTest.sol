//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract MappingKeyTest {
  type MyInt is int8;
  mapping(MyInt => MyInt) wrapMap;
  event Done();

  function run() public {
    wrapMap[MyInt.wrap(-1)] = MyInt.wrap(-1);
    emit Done();
  }

}

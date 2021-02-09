//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ResultTest {

  struct Pair {
    uint8 x;
    uint8 y;
  }

  event Void();

  function void() public {
    emit Void();
  }

  event Number(uint8 z);
  event NumberI(uint8 indexed z);

  function number() public returns (uint8 z) {
    emit Number(1);
    emit NumberI(1);
    return 1;
  }

  event Array(uint8[2] z);
  event ArrayI(uint8[2] indexed z);

  function array() public returns (uint8[2] memory z) {
    uint8[2] memory x = [1,2];
    emit Array(x);
    emit ArrayI(x);
    return x;
  }

  event Tuple(Pair z);
  event TupleI(Pair indexed z);

  function tuple() public returns (Pair memory z) {
    Pair memory x = Pair(1,2);
    emit Tuple(x);
    emit TupleI(x);
    return x;
  }

  event TwoNumbers(uint8 z, uint8 w);
  event TwoNumbersH(uint8 indexed z, uint8 w);
  event TwoNumbersI(uint8 indexed z, uint8 indexed w);

  function twoNumbers() public returns (uint8 z, uint8 w) {
    emit TwoNumbers(1, 2);
    emit TwoNumbersH(1, 2);
    emit TwoNumbersI(1, 2);
    return (1,2);
  }

  event TwoArrays(uint8[2] z, uint8[2] w);
  event TwoArraysH(uint8[2] indexed z, uint8[2] w);
  event TwoArraysI(uint8[2] indexed z, uint8[2] indexed w);

  function twoArrays() public returns (uint8[2] memory z, uint8[2] memory w) {
    (uint8[2] memory x, uint8[2] memory y) = ([1, 2], [3, 4]);
    emit TwoArrays(x, y);
    emit TwoArraysH(x, y);
    emit TwoArraysI(x, y);
    return (x, y);
  }

  event TwoTuples(Pair z, Pair w);
  event TwoTuplesH(Pair indexed z, Pair w);
  event TwoTuplesI(Pair indexed z, Pair indexed w);

  function twoTuples() public returns (Pair memory z, Pair memory w) {
    (Pair memory x, Pair memory y) = (Pair(1,2), Pair(3,4));
    emit TwoTuples(x,y);
    emit TwoTuplesH(x,y);
    emit TwoTuplesI(x,y);
    return (x,y);
  }

  event StringI(string indexed z);
  event BytesI(bytes indexed z);
  event DynamicI(uint8[] indexed z);

  function badIndex() public {
    emit StringI("hello");
    emit BytesI(hex"deadbeef");
    emit DynamicI(new uint8[](1));
  }

  event CauseTrouble(uint __length__);

  function causeTrouble() public {
    emit CauseTrouble(107);
  }
}

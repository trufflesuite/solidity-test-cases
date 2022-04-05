//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract UnknownTest {

  struct Pair {
    uint x;
    uint y;
  }

  uint known;
  uint unknown;
  Pair partialPair;
  uint[2] partialArray;
  uint[] partialDynamic;
  mapping(uint => uint) theMap;

  event Num(uint);

  constructor() {
    known = 1;
    unknown = 2;
    partialPair.x = 3;
    partialPair.y = 4;
    partialArray[0] = 5;
    partialArray[1] = 6;
    partialDynamic.push(7);
    partialDynamic.push(8);
    theMap[9] = 9;
  }

  function run() public {
    emit Num(known);
    emit Num(partialPair.x);
    emit Num(partialArray[0]);
    emit Num(partialDynamic[0]);
    emit Num(theMap[9]);
    emit Num(0);
  }

}

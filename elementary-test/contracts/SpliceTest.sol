//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SpliceTest {
  //splicing is (nontrivially) used in two contexts right now:
  //1. decoding nested memory structures
  //2. decoding mapping keys pointed to by a memory variable
  //we'll also test some trivial splicing, I guess

  event Done();

  mapping(string => string) stringMap;

  struct ArrayPair {
    uint[2] x;
    uint[2] y;
  }

  string pointedAt = "key2";

  function run() public {
    uint[2][2] memory arrayArray;
    ArrayPair memory arrayStruct;

    arrayArray[0][0] = 1;
    arrayArray[0][1] = 2;
    arrayArray[1][0] = 3;
    arrayArray[1][1] = 4;

    arrayStruct.x[0] = 1;
    arrayStruct.x[1] = 2;
    arrayStruct.y[0] = 3;
    arrayStruct.y[1] = 4;

    string memory key1 = "key1";
    string storage key2 = pointedAt;

    stringMap[key1] = "value1";
    stringMap[key2] = "value2";

    emit Done(); //break here (40)
  }
}

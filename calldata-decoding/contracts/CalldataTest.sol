pragma solidity ^0.5.4;
pragma experimental ABIEncoderV2;

//needs testing:
//0. call from outside
//1. ordinary call
//2. delegate call
//3. static call
//4. decode string
//5. decode bytes
//6. decode static array
//7. decode dynamic array
//8. decode struct
//9. complex decoding

contract CalldataTest {

  event Done();

  struct Pair {
    uint x;
    uint y;
  }

  struct PairPair {
    Pair x;
    Pair y;
  }

  struct ArrayPair {
    uint[2] x;
    uint[2] y;
  }

  //use both with simpleTester and directly
  function simpleTest(string calldata hello) external returns (string memory echo) {
    echo = hello;
    emit Done();
  }

  function simpleTester() public {
    this.simpleTest("hello world");
  }

  function staticTest(string calldata hello) external pure returns (string memory echo) {
    echo = hello;
  }

  function staticTester() public {
    this.staticTest("hello world");
    emit Done();
  }

  function delegateTester() public {
    CalldataLibrary.delegateTest("hello world");
  }

  function multiTest(
    string calldata hello,
    bytes calldata deadbeef,
    uint[2] calldata twoInts,
    uint[] calldata manyInts,
    Pair calldata pair)
  external returns (uint sum) {
      sum = pair.x
        + twoInts[0]
        + manyInts.length
        + deadbeef.length
        + bytes(hello).length;
      emit Done();
  }

  function multiTester() public {
    uint[2] memory twoInts;
    twoInts[0] = 107;
    twoInts[1] = 683;
    uint[] memory someInts;
    someInts = new uint[](2);
    someInts[0] = 41;
    someInts[1] = 42;
    Pair memory pair;
    pair.x = 321;
    pair.y = 2049;
    this.multiTest("hello", hex"deadbeef", twoInts, someInts, pair);
  }

  function complexTest(
    Pair[2] calldata structArray,
    Pair[] calldata structArrayDyn,
    PairPair calldata structStruct,
    uint[2][2] calldata arrayArray,
    uint[2][] calldata arrayArrayDyn,
    ArrayPair calldata arrayStruct
  ) external returns (uint sum) {
    sum = structArray[0].x
      + structArrayDyn.length
      + structStruct.x.x
      + arrayArray[0][0]
      + arrayArrayDyn.length
      + arrayStruct.x[0];
    emit Done();
  }

  function complexTester() public {
    Pair[2] memory structArray;
    structArray[0].x = 1;
    structArray[0].y = 2;
    structArray[1].x = 3;
    structArray[1].y = 4;
    Pair[] memory structArrayDyn;
    structArrayDyn = new Pair[](2);
    structArrayDyn[0].x = 1;
    structArrayDyn[0].y = 2;
    structArrayDyn[1].x = 3;
    structArrayDyn[1].y = 4;
    PairPair memory structStruct;
    structStruct.x.x = 1;
    structStruct.x.y = 2;
    structStruct.y.x = 3;
    structStruct.y.y = 4;
    uint[2][2] memory arrayArray;
    arrayArray[0][0] = 1;
    arrayArray[0][1] = 2;
    arrayArray[1][0] = 3;
    arrayArray[1][1] = 4;
    uint[2][] memory arrayArrayDyn;
    arrayArrayDyn = new uint[2][](2);
    arrayArrayDyn[0][0] = 1;
    arrayArrayDyn[0][1] = 2;
    arrayArrayDyn[1][0] = 3;
    arrayArrayDyn[1][1] = 4;
    ArrayPair memory arrayStruct;
    arrayStruct.x[0] = 1;
    arrayStruct.x[1] = 2;
    arrayStruct.y[0] = 3;
    arrayStruct.y[1] = 4;
    this.complexTest(structArray, structArrayDyn, structStruct, arrayArray, arrayArrayDyn, arrayStruct);
  }
}

library CalldataLibrary {

  event Done();

  function delegateTest(string calldata hello) external returns (string memory echo) {
    echo = hello;
    emit Done();
  }
}

pragma solidity ^0.5.6;
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
//10. complex decoding with dynamic innards!

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

  struct ArrayDynPair {
    uint[] x;
    uint[] y;
  }

  struct StringPair {
    string x;
    string y;
  }

  struct StringPairPair {
    StringPair x;
    StringPair y;
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

  function complexDynTest1(
    string[2] calldata stringArray,
    string[] calldata stringArrayDyn,
    StringPair calldata stringStruct
  ) external returns (uint sum) {
    sum = bytes(stringArray[0]).length
      + stringArrayDyn.length
      + bytes(stringStruct.x).length;
    emit Done();
  }

  function complexDynTester1() public {
    string[2] memory stringArray;
    stringArray[0] = "a";
    stringArray[1] = "bc";
    string[] memory stringArrayDyn;
    stringArrayDyn = new string[](2);
    stringArrayDyn[0] = "a";
    stringArrayDyn[1] = "bc";
    StringPair memory stringStruct;
    stringStruct.x = "a";
    stringStruct.y = "bc";
    this.complexDynTest1(
      stringArray,
      stringArrayDyn,
      stringStruct
    );
  }

  function complexDynTest2(
    uint[][2] calldata arrayDynArray,
    uint[][] calldata arrayDynArrayDyn,
    ArrayDynPair calldata arrayDynStruct,
    StringPair[2] calldata structDynArray,
    StringPair[] calldata structDynArrayDyn,
    StringPairPair calldata structDynStruct
  ) external returns (uint sum) {
    sum = arrayDynArray[0].length
      + arrayDynArrayDyn.length
      + arrayDynStruct.x.length
      + bytes(structDynArray[0].x).length
      + structDynArrayDyn.length
      + bytes(structDynStruct.x.x).length;
    emit Done();
  }

  function complexDynTester2() public {
    uint[][2] memory arrayDynArray;
    arrayDynArray[0] = new uint[](2);
    arrayDynArray[0][0] = 1;
    arrayDynArray[0][1] = 2;
    arrayDynArray[1] = new uint[](2);
    arrayDynArray[1][0] = 3;
    arrayDynArray[1][1] = 4;
    uint[][] memory arrayDynArrayDyn;
    arrayDynArrayDyn = new uint[][](2);
    arrayDynArrayDyn[0] = new uint[](2);
    arrayDynArrayDyn[0][0] = 1;
    arrayDynArrayDyn[0][1] = 2;
    arrayDynArrayDyn[1] = new uint[](2);
    arrayDynArrayDyn[1][0] = 3;
    arrayDynArrayDyn[1][1] = 4;
    ArrayDynPair memory arrayDynStruct;
    arrayDynStruct.x = new uint[](2);
    arrayDynStruct.x[0] = 1;
    arrayDynStruct.x[1] = 2;
    arrayDynStruct.y = new uint[](2);
    arrayDynStruct.y[0] = 3;
    arrayDynStruct.y[1] = 4;
    StringPair[2] memory structDynArray;
    structDynArray[0].x = "a";
    structDynArray[0].y = "bc";
    structDynArray[1].x = "def";
    structDynArray[1].y = "ghij";
    StringPair[] memory structDynArrayDyn;
    structDynArrayDyn = new StringPair[](2);
    structDynArrayDyn[0].x = "a";
    structDynArrayDyn[0].y = "bc";
    structDynArrayDyn[1].x = "def";
    structDynArrayDyn[1].y = "ghij";
    StringPairPair memory structDynStruct;
    structDynStruct.x.x = "a";
    structDynStruct.x.y = "bc";
    structDynStruct.y.x = "def";
    structDynStruct.y.y = "ghij";
    this.complexDynTest2(
      arrayDynArray,
      arrayDynArrayDyn,
      arrayDynStruct,
      structDynArray,
      structDynArrayDyn,
      structDynStruct
    );
  }
}

library CalldataLibrary {

  event Done();

  function delegateTest(string calldata hello) external returns (string memory echo) {
    echo = hello;
    emit Done();
  }
}

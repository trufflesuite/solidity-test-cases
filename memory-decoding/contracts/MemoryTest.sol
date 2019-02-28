pragma solidity ^0.5.4;

contract MemoryTest {

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
    emit Done();
  }
}

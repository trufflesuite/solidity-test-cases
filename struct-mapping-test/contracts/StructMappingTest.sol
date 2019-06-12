pragma solidity ^0.5.1;

contract StructMappingTest {
  /*
  struct HasMapping {
    mapping(string => string) theMap;
  }
  HasMapping hasMapping;
  */
  mapping(string => string)[] manyMaps;
  function run() public {
    //hasMapping.theMap["hello"] = "world";
    manyMaps.length = 1;
    manyMaps[0]["foo"] = "bar";
  }
}

contract EmptyStructTest {
  struct EmptyStruct {
    mapping(string => string) theMap;
  }
  function run() public {
    int[1] memory preBarrier;
    preBarrier[0] = -1;
    EmptyStruct[3] memory whoKnows;
    int[1] memory postBarrier;
    postBarrier[0] = -1;
  }
}

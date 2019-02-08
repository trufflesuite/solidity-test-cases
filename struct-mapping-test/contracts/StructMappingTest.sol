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

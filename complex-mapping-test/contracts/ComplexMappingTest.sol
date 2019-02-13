pragma solidity ^0.5.3;

contract ComplexMappingTest {

  event Done();

  struct HasMappingOuter {
    mapping(string => HasMappingInner[2]) map;
  }

  struct HasMappingInner {
    mapping(string => uint) map;
  }

  HasMappingOuter[2] it;

  mapping(string => uint)[2] mapArray;

  mapping(string => mapping(string => uint)) mapMap;

  mapping(uint => uint) simpleMap;

  uint[2] array;

  mapping(uint => uint)[2] twoMaps;

  function run() public {
    it[0].map["hello"][1].map["goodbye"] = 107;
    mapArray[0]["hello"] = 82;
    mapMap["hello"]["goodbye"] = 683;
    array[0] = 3;
    simpleMap[array[0]] = 5;
    simpleMap[simpleMap[3]] = 7;
    simpleMap[array[1] = 11] = 13;
    emit Done();
  }

  function returnMappingTest() public {
    returnsMapping(twoMaps)[1] = 8;
    emit Done();
  }

  function returnsMapping(mapping(uint => uint)[2] storage maps) internal view returns (mapping(uint => uint) storage) {
    return maps[0];
  }
}

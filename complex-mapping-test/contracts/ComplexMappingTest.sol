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

  function run() public {
    it[0].map["hello"][1].map["goodbye"] = 107;
    mapArray[0]["hello"] = 82;
    mapMap["hello"]["goodbye"] = 683;
    emit Done();
  }
}

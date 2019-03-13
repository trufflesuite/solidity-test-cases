pragma solidity ^0.5.6;

contract MappingPointerTest {
  mapping(string => uint) surface;

  event Done();

  function run() public {
    TouchLib.touch(surface);
    emit Done();
  }
}

library TouchLib {
  function touch(mapping(string => uint) storage surface) public {
    surface["ping!"] = 0;
  }
}

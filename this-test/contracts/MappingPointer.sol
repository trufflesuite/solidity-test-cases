pragma solidity ^0.5.6;

contract MappingPointerTest {
  mapping(string => uint) surface;
  mapping(uint => uint) numbers;

  event Done();

  function run() public {
    TouchLib.touch(surface);
    emit Done();
  }

  function runRecursive(uint n) public {
    numbers[n] = n+1;
    if(n > 0) {
      this.runRecursive(n - 1);
    }
    else {
      emit Done();
    }
  }
}

library TouchLib {
  function touch(mapping(string => uint) storage surface) public {
    surface["ping!"] = 1;
  }
}

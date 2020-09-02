//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

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
  function touch(mapping(string => uint) storage surface) external {
    surface["ping!"] = 1;
  }

  function lightTouch(uint[2] storage pair) external view returns (uint) {
    return pair[0];
  }
}

contract PreExisting {
  uint[2] pair;

  constructor() {
    pair[0] = 82;
  }

  event Done();

  function run() public returns (uint first) {
    first = TouchLib.lightTouch(pair);
    emit Done();
  }
}

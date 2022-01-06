//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CantCreate {
  constructor() {
    revert("Nope!");
  }
}

contract MappingMixup {

  mapping(uint => uint) mixup;
  uint simple;

  constructor(uint n, Tester invoker) {
    mixup[n] = 81;
    simple = 82 + n;
    if(n > 0) {
      invoker.mixup(n - 1);
    }
    else {
      revert("The inevitable reversion!");
    }
  }
}

contract Tester {

  MappingMixup mappingMixup;
  
  function mixup(uint n) public {
    mappingMixup = new MappingMixup(n, this);
  }
}

pragma solidity ^0.5.5;

contract CantCreate {
  constructor() public {
    revert("Nope!");
  }
}

contract MappingMixup {

  mapping(uint => uint) mixup;

  constructor(uint n, Tester invoker) public {
    mixup[n] = 81;
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

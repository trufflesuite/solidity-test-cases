//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Base {
  event baseEvent(uint);
  event bothEvent(uint);
  event nonOverride();
}

contract Derived is Base {
  //event bothEvent(uint indexed); //no longer allowed
  event derivedEvent(uint indexed);
  event nonOverride(uint);
  function run() public {
    emit baseEvent(1);
    emit Base.baseEvent(2);
    //emit bothEvent(3);
    emit Base.bothEvent(4);
    //emit Derived.bothEvent(5);
    emit derivedEvent(6);
    emit Derived.derivedEvent(7);
    emit nonOverride();
    emit nonOverride(8);
  }
}

contract Other {
  /*
  function run() public {
    emit Base.baseEvent(1); //doesn't work!
  }
  */
}

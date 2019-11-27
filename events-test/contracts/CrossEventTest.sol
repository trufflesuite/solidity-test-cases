pragma solidity ^0.5.13;

contract Base {
  event baseEvent(uint);
  event bothEvent(uint);
}

contract Derived is Base {
  event bothEvent(uint indexed);
  event derivedEvent(uint indexed);
  function run() public {
    emit baseEvent(1);
    emit Base.baseEvent(2);
    emit bothEvent(3);
    emit Base.bothEvent(4);
    emit Derived.bothEvent(5);
    emit derivedEvent(6);
    emit Derived.derivedEvent(7);
  }
}

contract Other {
  /*
  function run() public {
    emit Base.baseEvent(1); //doesn't work!
  }
  */
}

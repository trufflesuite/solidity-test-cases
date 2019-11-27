pragma solidity ^0.5.13;

contract Base {
  event baseEvent(uint);
}

contract Derived is Base {
  event baseEvent(uint indexed);
  function run() public {
    emit baseEvent(1);
  }
}

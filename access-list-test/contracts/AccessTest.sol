//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessTest {
  Auxiliary immutable public aux;
  uint public it = 1;
  uint public also = 1;
  constructor(Auxiliary _aux) {
    aux = _aux;
  }

  function run() public {
    it++;
    also++;
    aux.run();
  }
}

contract Auxiliary {
  event Running();
  function run() public {
    emit Running();
  }
}

//SPDX-License-Identifier: MIT
pragma solidity ^0.6.7;

contract ModifierTestGrandparent {
  event Constructing(uint);

  constructor(uint x) public {
    emit Constructing(x);
  }
}

contract ModifierTestParent is ModifierTestGrandparent(5) {
  constructor(uint x) public {
    emit Constructing(x);
  }
}

contract ModifierTest is ModifierTestParent(3) {
  constructor() public {
    emit Constructing(1);
  }

  event Before(string);
  event After(string);

  modifier emitting(string memory it) {
    emit Before(it);
    _;
    emit After(it);
  }

  function run() public emitting("greetings") {
    emit Constructing(0);
  }

  function runVariable(string memory input) public emitting(input) {
    emit Constructing(0);
  }
}

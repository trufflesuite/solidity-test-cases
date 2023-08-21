//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract ModifierTest {

  type MyInt is int8;

  event Floogly(MyInt);

  modifier woogly(MyInt boogly) {
    emit Floogly(boogly);
    _;
  }

  function run() public woogly(MyInt.wrap(5)) {
  }
}

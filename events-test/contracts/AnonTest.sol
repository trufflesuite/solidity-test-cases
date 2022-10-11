//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract AnonTest {

  uint x;

  function ext(uint, uint y) public {
    x = y;
  }

  constructor(uint, uint y) {
    x = y;
  }
}

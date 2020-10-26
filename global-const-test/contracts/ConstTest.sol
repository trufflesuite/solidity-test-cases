//SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./Constants.sol";

uint constant unity = 1;

contract ConstTest {
  event Sum(uint);
  uint state;
  uint constant constate = 3;
  function run() public {
    uint x = unity;
    uint y = secret;
    emit Sum(x + y);
  }
}

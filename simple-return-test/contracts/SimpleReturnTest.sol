//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract SimpleReturnTest {
  function increment(uint x) public returns (uint) {
    return x+1;
  }
}

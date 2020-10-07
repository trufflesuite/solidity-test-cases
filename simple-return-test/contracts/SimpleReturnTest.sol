//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract SimpleReturnTest {
  function split(uint x) public returns (uint, uint) {
    return (x + 1, x - 1);
  }
}

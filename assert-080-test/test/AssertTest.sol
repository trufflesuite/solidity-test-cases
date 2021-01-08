//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle/AssertInt.sol";

contract AssertTest {
  function test() public {
    AssertInt.equal(1, 2, "florf");
  }
}

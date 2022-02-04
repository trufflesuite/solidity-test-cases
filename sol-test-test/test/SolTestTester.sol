//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "../contracts/SolTestTest.sol";
import "truffle/Assert.sol";

contract SolTestTester is SolTestTest {

  function test1() public {
    this.run(true);
    Assert.equal(uint(1), 1, "");
  }

  function test2() public {
    this.run(false);
  }

  function test3() public {
    Assert.equal(uint(1), 2, "uh-oh");
  }
}

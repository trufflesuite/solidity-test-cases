pragma solidity ^0.5.10;

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
}

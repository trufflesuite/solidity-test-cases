pragma solidity ^0.5.10;

import "../contracts/SolTestTest.sol";

contract SolTestTester is SolTestTest {

  function test1() public {
    this.run(true);
  }

  function test2() public {
    this.run(false);
  }
}

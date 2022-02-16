//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../contracts/StrangeEventTest.sol";

contract StrangeEventTester is StrangeEventTest {

  function test1() public {
    this.run();
  }
}

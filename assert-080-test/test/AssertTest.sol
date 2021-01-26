//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "truffle/NewSafeSend.sol";

contract AssertTest {
  function test() public {
    AssertInt.equal(1, 2, "florf");
  }
}

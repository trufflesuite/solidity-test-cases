//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract MinimalFunctionTest {
  event Function(function() external);
  function run() external {
    emit Function(this.run);
  }
}

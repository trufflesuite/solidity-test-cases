//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract SolTestTest {
  event Here();

  function run(bool success) public {
    emit Here();
    if (!success) {
      revert("Nope!");
    }
  }
}

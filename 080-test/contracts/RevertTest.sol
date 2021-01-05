//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RevertTest {

  event Here();

  function run(bool which) public {
    emit Here();
    if (which) {
      revert("true!");
    } else {
      revert("false!");
    }
  }
}

//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract HiddenSolidity {
  event Done();
  function test() public {
    emit Done();
  }
}

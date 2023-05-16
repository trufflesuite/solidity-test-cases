//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract PackedEncodingTest {
  event Strings(string[2] indexed strings);
  function run() public {
    emit Strings(["A", "B"]);
  }
}

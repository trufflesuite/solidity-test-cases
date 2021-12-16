//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnderscoreTest {

  bytes2 pair;

  function run() public {
    pair = 0xfff_f;
    //pair = hex"fff_f";
    pair = hex"ff_ff";
  }
}

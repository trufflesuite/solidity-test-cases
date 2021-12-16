//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnderscoreTest {

  bytes2 pair;
  uint256 num;

  function run() public {
    pair = 0xfff_f;
    //pair = hex"fff_f";
    pair = hex"ff_ff";
    //pair = 0x_ffff;
    num = 1_1;
    num = 1_1e1_0;
    //num = 1_e10;
    //num = 1e_10;
  }
}

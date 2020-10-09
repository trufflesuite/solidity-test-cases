//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

import "../contracts/SliceTest.sol";

contract Test is SliceTest {

  function test() public {
    uint[] memory input = new uint[](5);
    for(uint i = 0; i < 5; i++) {
      input[i] = i + 1;
    }
    this.arrayTest(input);
  }

}

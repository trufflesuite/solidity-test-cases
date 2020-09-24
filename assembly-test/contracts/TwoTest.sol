//SPDX-License-Identifier: MIT
pragma solidity ^0.7.1;

contract TwoTest {

  uint8 x;

  uint8 constant y = 1;

  uint8 constant z1 = 3 + 4;

  uint8 constant z = 1 > 0 ? 9 : 8;

  uint8 immutable w = 5;

  function twoTest(string calldata s, uint[1] calldata it) external {
    function(string memory, uint[1] memory) external fn = this.twoTest;
    assembly {
      log1(0, 0, it)
      log1(0, 0, x.slot)
      log1(0, 0, x.offset)
      log1(0, 0, y)
      log1(0, 0, z1)
      /*
      log1(0, 0, z2)
      log1(0, 0, w)
      log1(0, 0, x)
      log1(0, 0, s)
      log1(0, 0, s.length)
      log1(0, 0, w.offset)
      log1(0, 0, fn)
      log1(0, 0, fn.address)
      log1(0, 0, fn.selector)
      */
    }
  }
}

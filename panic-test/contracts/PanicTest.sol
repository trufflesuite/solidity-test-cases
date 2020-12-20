//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PanicTest {

  function runAssert() public {
    assert(false);
  }

  enum TooSmall { Only }

  uint8[] arr;

  function overflow() public returns (uint8) {
    uint8 x = 255;
    uint8 y = 255;
    return x + y;
  }

  function divZero() public returns (uint8) {
    uint8 x = 1;
    uint8 y = 0;
    return x/y;
  }

  function badCast() public returns (TooSmall) {
    uint8 x = 1;
    return TooSmall(x);
  }

  //skipping malformed string

  function underflow() public {
    delete arr;
    arr.pop();
  }

  function oob() public returns (uint8) {
    delete arr;
    return arr[1];
  }

  //skipping oom

  function badCall() public {
    function() internal f;
    f();
  }

}

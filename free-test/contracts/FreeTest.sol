//SPDX-License-Identifier: MIT
pragma solidity ^0.7.1;

function free() {
  Lib.it();
}

contract FreeTest {
  event Done();
  function run() public {
    function() internal fn = free;
    fn();
    emit Done();
  }
}

library Lib {
  event Done();
  function it() internal {
    emit Done();
  }
}

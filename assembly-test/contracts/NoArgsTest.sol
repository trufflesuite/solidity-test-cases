//SPDX-License-Identifier: MIT
pragma solidity ^0.7.1;

contract NoArgsTest {
  function run() public {
    assembly {
      function f() -> a {
        a := 1
        log1(0, 0, a)
      }
      let x := f()
      log1(0, 0, x)
    }
  }
}

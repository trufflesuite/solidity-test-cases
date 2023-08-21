//SPDX-License-Identifier: MIT
pragma solidity ^0.7.1;

contract InitFromFnTest {
  function run() public {
    assembly {
      function f() -> a {
        a := 1
        log1(0, 0, a)
      }
      function g(b) -> c {
        c := mul(b, 2)
      }
      let x := f()
      let y := g(5)
      let z := add(1, 1)
      log3(0, 0, x, y, z)
    }
  }
}

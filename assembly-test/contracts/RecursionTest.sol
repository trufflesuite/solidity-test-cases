//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract RecursionTest {

  event Done();

  function yulFac(uint n) public returns (uint out) {
    assembly {
      function factorial(k) -> fac {
        switch k
        case 0 {
          fac := 1
        }
        default {
          fac := mul(k, factorial(sub(k, 1)))
        }
      }
      out := factorial(n)
    }
    emit Done();
  }
}

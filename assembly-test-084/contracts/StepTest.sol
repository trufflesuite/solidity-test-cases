//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StepTest {
  function run() public {
    assembly {
      function f() { //YUL CALLED LINE
        log1(0,0,2) //YUL INSIDE LINE
      }
      log1(0,0,1) //YUL INTERMED LINE
      f() //YUL CALL LINE
      log1(0,0,3) //YUL AFTER LINE
    }
  }
}

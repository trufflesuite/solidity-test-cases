//SPDX-License-Identifier: MIT
pragma solidity ^0.7.1;

contract ObjectTest {

  function run() public {
    assembly {
      //objects not allowed in this context, seems!
      /*
      object "thingy" {
        code {
          stop()
        }
        data hex"00"
      }
      */
    }
  }
}

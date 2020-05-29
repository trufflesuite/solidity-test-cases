//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

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

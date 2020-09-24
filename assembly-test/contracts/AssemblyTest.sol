//SPDX-License-Identifier: MIT
pragma solidity ^0.7.1;

contract AssemblyTest {
  function run(uint[2] storage pair) view internal {
    assembly {
      switch pair.offset
      case 0 {
        let padd := add(msize(), 32)
        mstore(padd,add(sload(pair.slot), sload(add(pair.slot,1))))
        return(padd,32)
      }
      case 31 {
        /*
        dup1
        swap1
        pop
        */
      }
      default {
        let adddot := add(msize(), 32)
        mstore(adddot,"???")
        revert(adddot,3)
      }
    }
    string memory done = "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii";
    require(pair[0] == 0, done);
  }
}

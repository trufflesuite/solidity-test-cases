pragma solidity ^0.6.0;

contract AssemblyTest {
  function run(uint[2] storage pair) view internal {
    assembly {
      switch pair_offset
      case 0 {
        let p.add := add(msize(), 32)
        mstore(p.add,add(sload(pair_slot), sload(add(pair_slot,1))))
        return(p.add,32)
      }
      case 31 {
        /*
        dup1
        swap1
        pop
        */
      }
      default {
        let add. := add(msize(), 32)
        mstore(add.,"???")
        revert(add.,3)
      }
    }
    string memory done = "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii";
    require(pair[0] == 0, done);
  }
}

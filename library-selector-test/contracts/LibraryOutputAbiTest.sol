//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

contract Dummy {
}

library LibraryOutputAbiTest {

  enum Ternary {
    Yes, No, MaybeSo
  }

  struct Pair {
    uint x;
    uint y;
  }

  function silly() external returns (Ternary, Pair memory, Dummy) {
    return (Ternary.No, Pair(1, 2), new Dummy());
  }
}

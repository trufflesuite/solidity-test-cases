//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

library ABITest {

  struct Pair {
    uint x;
    uint y;
  }

  function structy(Pair calldata) external view {
  }

  enum Ternary {
    Yes, No, MaybeSo
  }

  function enumy(Ternary) external view {
  }

  function contracty(Blank) external view {
  }
}

contract Blank {
}

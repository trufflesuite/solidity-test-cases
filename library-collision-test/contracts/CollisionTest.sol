//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Library as Library1 } from "./library1.sol";
import { Library as Library2 } from "./library2.sol";

contract CollisionTest {
  function run() public {
    Library1.doStuff();
    Library2.doStuff();
  }
}

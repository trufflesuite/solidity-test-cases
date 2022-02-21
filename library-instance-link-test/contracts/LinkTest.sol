//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract UsesLibrary {
  function run() public {
    TheLibrary.doStuff();
  }
}

library TheLibrary {
  event Stuff();
  function doStuff() external {
    emit Stuff();
  }
}

//SPDX-License-Identifier: MIT
pragma solidity 0.5.0;

contract VizTest {

  function test(uint) public returns (uint) {
    Library.outlined(85);
  }

}

library Library {

  event Dummy();

  function inlined(uint) internal returns (uint) {
    emit Dummy();
    return 88;
  }

  function outlined(uint) external returns (uint) {
    emit Dummy();
    inlined(47);
    return 93;
  }
}

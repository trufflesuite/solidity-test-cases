//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract ErrorTest {
  bytes1 immutable secret;

  event Done();

  constructor() {
    secret = 0xff;
    emit Done();
  }

  function run() public {
    emit Done();
  }
}

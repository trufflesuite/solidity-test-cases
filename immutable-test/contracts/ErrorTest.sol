pragma solidity ^0.6.6;

contract ErrorTest {
  byte immutable secret;

  event Done();

  constructor() public {
    secret = 0xff;
    emit Done();
  }

  function run() public {
    emit Done();
  }
}

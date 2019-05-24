pragma solidity ^0.5.8;

contract Tester {
  function run() public {
    Created B = new Created(82);
    B.fail();
  }
}

contract Created {

  int secret;

  constructor(int x) public {
    secret = x;
  }

  function fail() public {
    secret = -secret;
    revert();
  }
}

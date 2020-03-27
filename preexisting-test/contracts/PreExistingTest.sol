pragma solidity ^0.6.4;

contract PreExistingTest {
  string secretKey;
  mapping(string => bool) secretSet;

  constructor() public {
    secretKey = "xyzzy";
  }

  function run() public {
    secretSet[secretKey] = true;
  }
}

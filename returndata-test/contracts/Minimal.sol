pragma solidity ^0.6.7;

contract Fail {
  function fail() public {
    revert("");
  }
}

contract Return {
  function run() public returns (string memory) {
    return "AAAAAAAA";
  }
}

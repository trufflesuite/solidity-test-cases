pragma solidity ^0.5.10;

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

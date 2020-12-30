//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InternalTest {

  uint[][] list;

  function run() public {
    list.push(new uint[](0));
    list[0] = [2, 3];
    delete list;
    uint[][] memory mem = list;
    bytes memory str = type(Sink).creationCode;
  }
}

contract Sink {
  constructor() payable {
  }
  fallback() external payable {
  }
}

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EnsTest {

  address example;
  address noExample;
  address immutable public registryAddress;

  constructor(address _example, address _noExample, address _registryAddress) {
    example = _example;
    noExample = _noExample;
    registryAddress = _registryAddress;
  }

  event Note(address);

  function run() public {
    emit Note(example);
    emit Note(noExample);
  }
}

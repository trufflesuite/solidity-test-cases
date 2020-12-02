//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma experimental SMTChecker;

contract Sink {
  fallback() external payable {
  }
  constructor() payable {
  }
}

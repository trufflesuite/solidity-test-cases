pragma solidity ^0.6.7;

contract Utf8Test {
  function run() public pure returns (string memory) {
    return '\u00A1\u00A1\u00A1';
  }
}

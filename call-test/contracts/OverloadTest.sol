//SPDX-License-Identifer: MIT
pragma solidity ^0.8.19;

contract OverloadTest {

  enum Color { Red, Green, Blue }

  struct Pair { uint x; uint y; }

  function recognize(string memory x) public pure returns (string memory) {
    return "You input a string!";
  }

  function recognize(int256 x) public pure returns (string memory) {
    return "You input a signed integer!";
  }

  function recognize(address x) public pure returns (string memory) {
    return "You input an address!";
  }

  function recognize(Color x) public pure returns (string memory) {
    return "You input an enum!";
  }

  function recognize(uint[] memory x) public pure returns (string memory) {
    return "You input an array!";
  }

  function recognize(Pair memory x) public pure returns (string memory) {
    return "You input a struct!";
  }
}

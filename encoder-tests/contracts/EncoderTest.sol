//SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract EncoderTest {

  enum Color {
    Black, Blue, Green, Cyan, Red, Magenta, Yellow, White
  }

  enum MinusColor {
    White, Yellow, Magenta, Red, Cyan, Green, Blue, Black
  }

  struct Jumble {
    uint8 x;
    string y;
  }

  struct Pair {
    uint8 x;
    uint8 y;
  }

  constructor(uint x) {
  }

  function takesUint(uint x) public {
  }

  function takesInt(int x) public {
  }

  function takesUint8(uint8 x) public {
  }

  function takesInt8(int8 x) public {
  }

  function takesFunction(function() external x) public {
  }

  function takesString(string memory x) public {
  }
  
  function takesBytes(bytes memory x) public {
  }

  function takesBytes32(bytes32 x) public {
  }

  function takesBytes1(bytes1 x) public {
  }

  function takesAddress(address x) public {
  }

  function takesColor(Color x) public {
  }

  function takesMinusColor(MinusColor x) public {
  }

  function takesBool(bool x) public {
  }

  function takesContract(EncoderTest x) public {
  }

  function takesArray(uint8[] memory x) public {
  }

  function takesStatic(uint[2] memory x) public {
  }

  function takesJumble(Jumble memory x) public {
  }

  function takesMultiple(uint8 x, uint8 y) public {
  }

  function overloaded(uint8 x) public {
  }

  function overloaded(string memory x) public {
  }

  function overloaded(uint8[2] memory x) public {
  }

  function overloaded(uint8[] memory x) public {
  }

  function overloaded(Jumble memory x) public {
  }

  function overloaded(Pair memory x) public {
  }

  function overloaded(uint8 x, uint8 y) public {
  }

  function overloaded(uint8 x, uint8 y, uint8 z, uint8 w) public {
  }

  function whichOne(uint8 x, string memory y) public {
  }

  function whichOne(string memory x, uint8 y) public {
  }
}

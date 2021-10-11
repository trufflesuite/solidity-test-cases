//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

library LibraryReturnTest {
  //cases:
  //1. simple, unambiguous case w/nothing weird
  //2. use a struct
  //3. use an enum or contract
  //4. use a uint, address, or address payable
  //5. like #3, but in a way that produces a pseudo-collision
  //note: #5 needs to be tested in decoder, not just debugger,
  //to test the case when the AST is absent

  function simple(bytes[1] calldata) external view returns (int) {
    return -1;
  }

  struct Pair {
    uint x;
    uint y;
  }

  function structy(Pair[1] calldata) external view returns (int) {
    return -1;
  }

  enum Ternary {
    Yes, No, MaybeSo
  }

  function enumy(Ternary[1] calldata, Sink[1] calldata) external view returns (int) { //test failed! ...because things don't work right
    return -1;
  }

  function wobbly(uint8[1] calldata, address[1] calldata, address payable[1] calldata) external view returns (int) {
    return -1;
  }

  /*
  function clashy(Ternary) external view returns (int) {
    return -1;
  }

  //clashes with *library* selector clashy(LibraryReturnTest.Ternary)
  function g6913783() external view returns (uint) {
    return 1;
  }
  */

  function g14393(Ternary) external view returns (uint) {
    return 1;
  }

  //clashes with *ordinary* selector g14393(uint8)
  //(this is the one to run)
  function a27129() external view returns (int) { //debugger test passed... but only because it didn't quite work right
    return -1;
  }
}

contract Sink {
  constructor() payable {
  }
  fallback() external payable {
  }
}

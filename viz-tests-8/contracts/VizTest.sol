//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VizTest {

  event Dummy();

  function testCall(uint x) public returns (uint y) {
    return called(x);
  }

  function called(uint x) public returns (uint y) {
    emit Dummy();
    return x + 1;
  }

  function testLibrary() public {
    VizLibrary.loudIncrement(1);
  }

  function testTransfer() public {
    payable(tx.origin).transfer(1);
  }

  fallback() external {
    called(msg.data.length);
  }

  function testRevert() public {
    callReverter();
  }

  function callReverter() public {
    revert("Oops!");
  }

  constructor() payable {
  }
}

contract Secondary {

  event Dummy();

  uint immutable x = another();
  uint immutable w;

  constructor(uint y) {
    w = y;
  }

  function another() public returns (uint z) {
    emit Dummy();
    return 2;
  }

  function secret() public returns (uint) {
    return x + w; //just here so x & w are used
  }
}

library VizLibrary {
  event Noise();

  function loudIncrement(uint x) external returns (uint y) {
    emit Noise();
    return x + 1;
  }
}

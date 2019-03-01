pragma solidity ^0.5.4;

contract ModifierTest {

  uint lastBoogly;

  uint[2] twoInts;

  event SomewhatDone();

  event Greet(string greeting);

  modifier woogly(uint boogly) {
    uint temp = boogly;
    lastBoogly = temp;
    _;
    uint temp2 = boogly;
    lastBoogly = temp2 * 2;
  }

  function doStuff(uint a, uint b) public woogly(lastBoogly + 1) returns (uint c) {
    c = a + b;
  }

  function scopeTest(uint a, uint b) public woogly(a * b) returns (uint c) {
    c = a + b;
  }

  modifier scary(uint[2] memory fright) {
    fright[0]++;
    _;
    fright[1]++;
  }

  function scaryTest(uint a) public scary([uint(0), 0]) returns (uint c) {
    c = a * 3;
    emit SomewhatDone();
  }

  modifier story(uint[2] storage uhhh) {
    uhhh[0]++;
    _;
    uhhh[1]++;
  }

  function storyTest(uint a) public story(twoInts) returns (uint c) {
    c = a * 5;
  }

  modifier takesTwo(uint x, uint y) {
    lastBoogly = x + y;
    _;
    lastBoogly = x * y;
  }

  function tttest(uint a, uint b) public takesTwo(a + b, a * b) returns (uint c) {
    c = a * a + b * b;
  }

  modifier takesTwoMem(string memory h, string memory g) {
    emit Greet(h);
    _;
    emit Greet(g);
  }

  function memtttest(string memory a, string memory b) public takesTwoMem(a, b) returns (uint c) {
    c = bytes(a).length + bytes(b).length;
  }

  modifier takesTwoMemRetry(uint[2] memory h, uint[2] memory g) {
    lastBoogly = h[0] + h[1];
    _;
    lastBoogly = g[0] + g[1];
  }

  function memtttest2(uint a, uint b) public takesTwoMemRetry([a, b], [a + b, a * b]) returns (uint c) {
    c = a * a + b * b;
  }
}

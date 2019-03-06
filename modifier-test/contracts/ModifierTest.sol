pragma solidity ^0.5.4;

contract ModifierTest {

  uint lastBoogly;

  uint[2] twoInts;

  uint accumulator;

  uint constant three = 3;

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

  function memtttestLiteral(uint a) public takesTwoMem("hello", "goodbye") returns (uint c) {
    c = a * 7;
  }

  modifier takesTwoMemRetry(uint[2] memory h, uint[2] memory g) {
    lastBoogly = h[0] + h[1];
    _;
    lastBoogly = g[0] + g[1];
  }

  function memtttest2(uint a, uint b) public takesTwoMemRetry([a, b], [a + b, a * b]) returns (uint c) {
    c = a * a + b * b;
  }

  modifier takesStringLast(uint n, string memory s) {
    emit Greet(s);
    _;
    lastBoogly = n;
  }

  function lastLiteral(uint a) public takesStringLast(a, "hi") returns (uint c) {
    c = a * 9;
  }

  modifier takesStringMid(uint n, string memory s, uint m) {
    emit Greet(s);
    _;
    lastBoogly = n + m;
  }

  function midLiteral(uint a) public takesStringMid(a, "hi", a * a) returns (uint c) {
    c = a * 3;
  }

  function twoMods(uint a, string memory s) public woogly(a * 2) takesTwoMem(s, s) returns (uint c) {
    c = a * a;
  }

  function sameMod(uint a) public takesTwo(a * 2, a * 3) takesTwo(a * 5, a * 7) returns (uint c) {
    c = a * a;
  }

  /*
  modifier inner(string memory s) {
    emit Greet(s);
    _;
    emit Greet(s);
  }

  modifier outer(string memory s) inner(s) {
    emit Greet(s);
    _;
    emit Greet(s);
  }
  */

  modifier runTwice(string memory s) {
    emit Greet(s);
    _;
    emit Greet(s);
    _;
    emit Greet(s);
  }

  function what(uint a, string memory s) public runTwice(s) woogly(a * 3) returns (uint c) {
    c = a * a;
  }

  modifier accumulate() {
    _;
    accumulator++;
    _;
    accumulator++;
  }

  modifier initialize(uint x) {
    accumulator = x;
    _;
  }

  function returnsWhat(uint start) public initialize(start) accumulate returns (uint c) {
    return accumulator * accumulator;
  }

  function receivesWhat() public {
    lastBoogly = returnsWhat(5);
  }

  /*
  modifier runNever() {
    emit SomewhatDone();
  }
  */

 modifier post(string memory s) {
   _;
   emit Greet(s);
 }

 function simple(uint a) public post("goodbye") returns (uint c) {
   c = a * 2;
 }

 function simple2(uint a) public post("goodbye") initialize(a) returns (uint c) {
   c = a * 2;
 }

 modifier pre(string memory s) {
   emit Greet(s);
   _;
 }

 function preTest(uint a) public pre("hello") returns (uint c) {
   c = a * 2;
 }

 modifier nothing() {
   _;
 }

 function nothingTest(uint a) public nothing() returns (uint c) {
   c = a * 2;
   emit SomewhatDone();
 }

 function constantTest() public woogly(three) returns (uint c) {
   c = 7;
 }

 function castTest(int a) public woogly(uint(a)) returns (int c) {
   c = a * 2;
 }

 function constantLast(uint a) public takesTwo(a, three) returns (uint c) {
   c = a * a;
 }

 modifier takesThree(uint n, uint m, uint k) {
   lastBoogly = n + m + k;
   _;
   lastBoogly = n * m * k;
 }

 function twoConstantsLast(uint a) public takesThree(a, three, three) returns (uint c) {
   c = a * 2;
 }

 modifier stringFirst(string memory s, uint n) {
   emit Greet(s);
   _;
   lastBoogly = n;
 }

 function literalThenConstant(uint a) public stringFirst("hello", three) returns (uint c) {
   c = a * 2;
 }
}

pragma solidity ^0.4.25;

contract ConstructorTest {

  uint8 public result;

  function testSimple() public //not intended as an actual test
  {
    result = 3;
  }

  function testSerial() public
  {
    uint8 x;
    uint8 y;
    SecretByte test1 = new SecretByte(107);
    x = test1.mangle();
    SecretByte test2 = new SecretByte(46);
    y = test2.mangle();
    result = x + y;
  }

  function testWSelf() public
  {
    result = 46;
    Testy tester = new Testy(this);
    tester.run();
  }

  function testNested(uint8 n) public returns (uint8 factorial)
  {
    NestTester testNest = new NestTester(n, this);
    factorial = testNest.factorial();
  }
}

contract SecretByte {

  uint8 private secret;

  constructor(uint8 n) public
  {
    secret = n;
  }

  function mangle() public view returns (uint8 mangled)
  {
    mangled = secret+1; //how dastardly!
  }
}

contract Testy {

  uint8 private silly;
  ConstructorTest private parent;

  constructor(ConstructorTest _parent) public
  {
    silly = 82;
    parent = _parent;
  }

  function run() public
  {
    parent.testSimple();
  }
}


contract NestTester {

  uint8 private level;
  uint8 public factorial;

  constructor(uint8 n, ConstructorTest parent) public
  {
    uint8 prevFac;
    level = n;
    if(n==0)
    {
      factorial = 1;
    }
    else
    {
      prevFac = parent.testNested(n-1);
      factorial = n * prevFac;
    }
  }
}

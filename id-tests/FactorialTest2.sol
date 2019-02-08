pragma solidity ^0.4.25;

contract FactorialTest2 {

  uint public result;

  function run(uint n) public returns (uint factorial)
  {
    FactorialTester test = new FactorialTester(n, this);
    factorial = test.factorial();
  }
}

contract FactorialTester {

  uint private level;
  uint public factorial;

  constructor(uint8 n, FactorialTest2 parent) public
  {
    uint prevFac;
    level = n;
    if(n==0)
    {
      factorial = 1;
    }
    else
    {
      prevFac = parent.run(n-1);
      factorial = n * prevFac;
    }
  }
}

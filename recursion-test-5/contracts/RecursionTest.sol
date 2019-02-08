pragma solidity ~0.5;

contract FactorialTest {

  uint lastResult;

  function factorial(uint n) public returns(uint nbang)
  {
    uint prev;
    uint prevFac;
    nbang = n;
    prev = n - 1; //break here (12)
    if(n>0)
    {
      prevFac = factorial(n - 1);
      nbang = n * prevFac;
    }
    else
    {
      nbang = 1;
    }
    lastResult = nbang; //break here (22)
  }
}

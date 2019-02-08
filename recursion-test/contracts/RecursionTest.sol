pragma solidity ^0.4.24;

contract RecursionTest {

  function factorial(uint n) public returns(uint nbang)
  {
    uint prev;
    uint prevFac;
    if(n>0)
    {
      prev = n-1;
      prevFac = factorial(n-1);
      nbang = n*prevFac;
    }
    else
    {
      nbang=1;
    }
  }
}

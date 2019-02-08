pragma solidity ^0.4.24;

contract FailureTest {

uint x;

  function fail()
  {
    x = 107;
    revert();
    //assert(false);
    //require(false);
    /*
    while(true)
    {
    }
    */
  }

  function loop()
  {
    x = 107;
    while(true)
    {
    }
  }
}

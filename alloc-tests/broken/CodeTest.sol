pragma solidity ^0.5.0;

contract CodeTest {

  event Done();

  function (uint8) internal intf;

  function frameTest(uint8 n) public
  {
    if(n>0) frameTest(n-1);
  }

  function internalTest() internal returns (function (uint8) internal result)
  {
    result = frameTest;
    intf = result;
    postBarrierIntf = -1;
    emit Done();
  }

  function internalTester() public
  {
    internalTest();
  }
}

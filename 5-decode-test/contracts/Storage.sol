pragma solidity ~0.5;

contract Storage
{
  uint[] multipleFullWordArray;
  uint16[] withinWordArray;
  uint64[] multiplePartWordArray;
  uint240[] inconvenientlyWordOffsetArray;
  string shortString;
  string longString;

  function run() public
  {
    multipleFullWordArray = [0,1,2];
    withinWordArray = [3,4,5,6,7,8,9,10,11,12];
    multiplePartWordArray = [13,14,15,16,17,18,19,20,21];
    inconvenientlyWordOffsetArray = [22,23,24];
    shortString = "hello world";
    longString = "solidity allocation is a fun lesson in endianness";
  }
}

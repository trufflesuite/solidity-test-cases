pragma solidity ~0.5;

contract Memory
{
  function run() public
  {
    uint[] memory multipleFullWordArray = new uint[](3);
    multipleFullWordArray[0] = 0;
    multipleFullWordArray[1] = 1;
    multipleFullWordArray[2] = 2;
    uint16[] memory withinWordArray = new uint16[](10);
    withinWordArray[0] = 3;
    withinWordArray[1] = 4;
    withinWordArray[2] = 5;
    withinWordArray[3] = 6;
    withinWordArray[4] = 7;
    withinWordArray[5] = 8;
    withinWordArray[6] = 9;
    withinWordArray[7] = 10;
    withinWordArray[8] = 11;
    withinWordArray[9] = 12;
    uint64[] memory multiplePartWordArray = new uint64[](9);
    multiplePartWordArray[0] = 13;
    multiplePartWordArray[1] = 14;
    multiplePartWordArray[2] = 15;
    multiplePartWordArray[3] = 16;
    multiplePartWordArray[4] = 17;
    multiplePartWordArray[5] = 18;
    multiplePartWordArray[6] = 19;
    multiplePartWordArray[7] = 20;
    multiplePartWordArray[8] = 21;
    uint240[] memory inconvenientlyWordOffsetArray = new uint240[](3);
    inconvenientlyWordOffsetArray[0] = 22;
    inconvenientlyWordOffsetArray[1] = 23;
    inconvenientlyWordOffsetArray[2] = 24;
    string memory shortString = "hello world";
    string memory longString = "solidity allocation is a fun lesson in endianness";
  }
}

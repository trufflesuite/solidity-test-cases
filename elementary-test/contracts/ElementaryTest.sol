pragma solidity ^0.6.6;

contract ElementaryTest {

  event Done(); //makes a useful breakpoint

  //storage variables to be tested
  mapping(bool => bool) boolMap;
  mapping(byte => byte) byteMap;
  mapping(bytes => bytes) bytesMap;
  mapping(uint => uint) uintMap;
  mapping(int => int) intMap;
  mapping(string => string) stringMap;
  mapping(address => address) addressMap;
  mapping(uint8 => uint8) uint8Map;

  function run() public {
    //local variables to be tested
    byte oneByte;
    byte[] memory severalBytes;

    //set up variables for testing
    oneByte = 0xff;
    severalBytes = new byte[](1);
    severalBytes[0] = 0xff;

    boolMap[true] = true;

    byteMap[0x01] = 0x01;
    byteMap[0xff] = 0xff;
    byteMap[byte(0x02)] = byte(0x02);

    bytesMap[hex'01'] = hex'01';
    bytesMap[hex'ff'] = hex'ff';

    uintMap[1] = 1;

    intMap[1] = 1;
    intMap[-1] = -1;

    uint8Map[uint8(byte(0x01))] = uint8(byte(0x01));
    uint8Map[uint8(int8(2))] = uint8(int8(2));

    addressMap[0x0000000000000000000000000000000000000001] =
      0x0000000000000000000000000000000000000001;
    addressMap[address(this)] = address(this);

    stringMap["innocuous string"] = "innocuous string";
    stringMap["0xdeadbeef"] = "0xdeadbeef";
    stringMap["12345"] = "12345";

    emit Done(); //break here (52)
  }
}

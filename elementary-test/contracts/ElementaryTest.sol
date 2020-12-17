//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElementaryTest {

  event Done(); //makes a useful breakpoint

  //storage variables to be tested
  mapping(bool => bool) boolMap;
  mapping(bytes1 => bytes1) byteMap;
  mapping(bytes => bytes) bytesMap;
  mapping(uint => uint) uintMap;
  mapping(int => int) intMap;
  mapping(string => string) stringMap;
  mapping(address => address) addressMap;
  mapping(uint8 => uint8) uint8Map;

  function run() public {
    //local variables to be tested
    bytes1 oneByte;
    bytes1[] memory severalBytes;

    //set up variables for testing
    oneByte = 0xff;
    severalBytes = new bytes1[](1);
    severalBytes[0] = 0xff;

    boolMap[true] = true;

    byteMap[0x01] = 0x01;
    byteMap[0xff] = 0xff;
    byteMap[bytes1(0x02)] = bytes1(0x02);

    bytesMap[hex'01'] = hex'01';
    bytesMap[hex'ff'] = hex'ff';

    uintMap[1] = 1;

    intMap[1] = 1;
    intMap[-1] = -1;

    uint8Map[uint8(bytes1(0x01))] = uint8(bytes1(0x01));
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

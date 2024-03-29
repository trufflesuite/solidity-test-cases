//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstantKeyTest {

  event Done();

  mapping (int => int) intMap;
  mapping (string => string) stringMap;
  mapping (bytes1 => bytes1) byteMap;
  mapping (bool => bool) boolMap;
  mapping (uint => uint) uintMap;

  int constant one = 1;
  int constant minus = -1;
  int constant eight = 3 + 5;
  int constant twelve = true ? 12 : 30;

  string constant hello = "hello";
  string constant goodbye = false ? "hello" : "goodbye";

  bytes1 constant shortOne = 0x01;
  bytes1 constant shortMinus = 0xff;
  bytes1 constant shortTwo = bytes1(true ? 0x02 : 0x03);

  bytes constant deadbeef = hex"deadbeef";

  bool constant verity = true;
  bool constant falsity = false ? true : false;

  function run() public {
    intMap[one] = 1;
    intMap[minus] = -1;
    intMap[eight] = 8;
    intMap[twelve] = 12;

    stringMap[hello] = "hello";
    stringMap[goodbye] = "goodbye";

    byteMap[shortOne] = 0x01;
    byteMap[shortMinus] = 0xff;
    byteMap[shortTwo] = 0x02;

    boolMap[verity] = true;
    boolMap[falsity] = true; //bad idea to use 0 as value

    intMap[eight + one] = 9;
    intMap[8 + 2] = 10;

    uintMap[deadbeef.length] = 4;

    emit Done(); //break here (51)
  }
}

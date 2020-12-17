//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataTest {
  mapping(uint => uint) uintMap;
  mapping(string => string) stringMap;
  mapping(bytes => bytes) bytesMap;

  event Done();

  struct HasString {
    string x;
  }

  function calldataTest(bytes calldata byteStr,
    bytes[2] calldata array,
    string[] calldata dynArray,
    HasString calldata hasString,
    uint[2] calldata numbers) external {
    bytesMap[byteStr] = byteStr;
    bytesMap[array[0]] = array[0];
    if(dynArray.length > 0) {
      stringMap[dynArray[0]] = dynArray[0];
    }
    stringMap[hasString.x] = hasString.x;
    stringMap[type(Empty).name] = type(Empty).name;
    uintMap[byteStr.length] = byteStr.length;
    uintMap[array.length] = array.length;
    uintMap[dynArray.length] = dynArray.length;
    uintMap[array[0].length] = array[0].length;
    uintMap[type(Empty).creationCode.length] = type(Empty).creationCode.length;
    uintMap[msg.data.length] = msg.data.length;
    uintMap[numbers[0]] = numbers[0];
    bytesMap[msg.data] = msg.data;
    bytesMap[bytes(byteStr[2:6])] = bytes(byteStr[2:6]);
    emit Done();
  }

  function calldataTester() public {
    bytes[2] memory array;
    uint[2] memory numbers;
    array[0] = hex"deadbeef";
    numbers[0] = 82;
    string[] memory dynArray = new string[](3);
    dynArray[0] = "string";
    this.calldataTest(hex"0123456789abcdef", array, dynArray, HasString("irrelevant"), numbers);
  }
}

contract Empty {
}

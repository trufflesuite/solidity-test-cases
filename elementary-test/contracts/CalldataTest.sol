pragma solidity ^0.5.6;
pragma experimental ABIEncoderV2;

contract CalldataTest {
  mapping(uint => uint) uintMap;
  mapping(string => string) stringMap;
  mapping(bytes => bytes) bytesMap;

  event Done();

  function calldataTest(bytes calldata byteStr,
    bytes[2] calldata array,
    string[] calldata dynArray) external {
    bytesMap[byteStr] = byteStr;
    bytesMap[array[0]] = array[0];
    if(dynArray.length > 0) {
      stringMap[dynArray[0]] = dynArray[0];
    }
    stringMap[type(Empty).name] = type(Empty).name;
    uintMap[byteStr.length] = byteStr.length;
    uintMap[array.length] = array.length;
    uintMap[dynArray.length] = dynArray.length;
    uintMap[array[0].length] = array[0].length;
    uintMap[type(Empty).creationCode.length] = type(Empty).creationCode.length;
    uintMap[msg.data.length] = msg.data.length;
    bytesMap[msg.data] = msg.data;
    emit Done();
  }

  function calldataTester() public {
    bytes[2] memory array;
    array[0] = hex"deadbeef";
    string[] memory dynArray = new string[](3);
    dynArray[0] = "string";
    this.calldataTest(hex"40", array, dynArray);
  }
}

contract Empty {
}

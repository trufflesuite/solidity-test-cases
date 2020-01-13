pragma solidity ^0.4.26;

contract DataTest {

  event Data(bytes);

  mapping(bytes => bytes) theMap;

  function run() public {
    bytes memory localData = msg.data;
    theMap[msg.data] = localData;
    emit Data(msg.data);
  }
}

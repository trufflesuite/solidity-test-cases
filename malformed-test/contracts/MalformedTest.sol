pragma solidity ^0.5.9;

contract MalformedTest {
  event TwoStrings(string,string);

  function run() public {
    string memory valid = new string(6);
    valid = hex'C2A1C2A1C2A1';
    bytes memory justSomeBytes = new bytes(3);
    justSomeBytes = hex'A1A1A1';
    string memory malformed = string(justSomeBytes);
    emit TwoStrings(valid, malformed);
  }
}

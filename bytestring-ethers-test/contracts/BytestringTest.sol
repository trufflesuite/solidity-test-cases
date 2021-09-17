//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract BytestringTest {

  event Bytes(bytes);

  function returnEmpty() public pure returns (bytes memory) {
    return hex"";
  }

  function returnBytes2() public pure returns (bytes2) {
    return 0x0000;
  }

  function returnString() public pure returns (string memory) {
    return "";
  }

  function returnMultiEmpty() public pure returns (bytes memory, bytes memory) {
    return (hex"", hex"");
  }

  function emitEmpty() public {
    emit Bytes(hex"");
  }

  function takesBytes(bytes memory) public pure {
  }

  function takesBytes2(bytes2) public pure {
  }

  function takesString(string memory) public pure {
  }
}

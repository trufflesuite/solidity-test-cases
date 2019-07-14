pragma solidity ^0.5.9;
pragma experimental ABIEncoderV2;

contract PackedEncodingTest {
  event Strings(string[2] indexed strings);
  function run() public {
    emit Strings(["A", "B"]);
  }
}

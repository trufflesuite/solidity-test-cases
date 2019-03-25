pragma solidity ^0.5.6;

contract Sha3Test {

  event Done();

  bytes32 x;
  bytes32 y;

  function run() public {
    x = keccak256(hex"00");
    y = keccak256(hex"");
    emit Done();
  }
}

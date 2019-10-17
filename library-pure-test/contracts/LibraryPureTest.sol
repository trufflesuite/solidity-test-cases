pragma solidity ^0.5.1;
pragma experimental ABIEncoderV2;

library HasPure {

  struct PointToMe {
    bytes32 x;
  }

  function flip(bytes32 x) external pure returns (bytes32) {
    return ~x;
  }

  function ignore(bytes32[] storage) external pure returns (bytes32) {
    return 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;
  }

  function identity(bytes32[] storage x) external pure returns (bytes32[] storage) {
    return x;
  }

  function flipView(bytes32 x) external view returns (bytes32) {
    return ~x;
  }

  function getLengthAsBytes(bytes32[] storage x) external view returns (bytes32) {
    return bytes32(x.length);
  }

  function badPointer() external pure returns (bytes32[] storage x) {
    x = x;
    return x;
  }

  function pre056test(mapping(bytes => bytes) storage, PointToMe storage, PointToMe calldata) external pure returns (bytes32) {
    return 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;
  }
}

contract Tester {
  bytes32[] arr;

  event Word(bytes32);

  function testIgnore() public {
    emit Word(HasPure.ignore(arr));
  }

  function testLength() public {
    emit Word(HasPure.getLengthAsBytes(arr));
  }

  /*
  function testStore() public returns (function(bytes32) external pure returns (bytes32)) {
    return HasPure.flip;
  }
  */
}

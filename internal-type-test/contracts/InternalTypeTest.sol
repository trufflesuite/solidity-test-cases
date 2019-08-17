pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

contract InternalTypeTest {

  enum Ternary { Yes, No, MaybeSo }

  struct Pair {
    uint x;
    uint y;
  }

  struct Outer {
    Ternary tag;
    uint[5] nums;
    Pair pair;
  }

  Outer public weird;

  string public name;

  function returnsStruct() public returns (Pair memory) {
    return Pair(1,2);
  }

  function returnsEnum() public returns (Ternary) {
    return Ternary.MaybeSo;
  }

  function returnsFunction() public returns (function() external returns (Ternary)) {
    return this.returnsEnum;
  }

  function returnsContract() public returns (InternalTypeTest) {
    return this;
  }

  function returnsAddressPayable() public returns (address payable) {
    return address(this);
  }

  function() external payable {
  }

  function bytesToBytes(bytes memory input) public returns (bytes memory) {
    return new bytes(input.length);
  }

  function bytesToBytesCalldata(bytes calldata input) external returns (bytes memory) {
    return new bytes(input.length);
  }
}

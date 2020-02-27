pragma solidity ^0.6.3;

contract UDTKeysTest {
  enum Ternary { Yes, No, MaybeSo }

  mapping(Ternary => string) public enumMap;

  mapping(UDTKeysTest => string) public contractMap;

  function run() public {
    enumMap[Ternary.No] = "enum spot!";
    contractMap[this] = "contract spot!";
  }

  function write(Ternary out) public {
    enumMap[out] = "where am I...?";
  }

  function read(Ternary out) public view returns (string memory) {
    return enumMap[out];
  }
}

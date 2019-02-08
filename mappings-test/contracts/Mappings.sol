pragma solidity ^0.4.24;

contract Mappings {
  struct Collection {
    mapping (uint256 => uint256) uints;
    mapping (string => uint256) strings;
  }

  Collection collection;

  function run() public {
    uint x = 1;
    collection.uints[0] = 10;
    collection.uints[x] = 11;
    collection.uints[2] = 12;

    string memory foo = "foo";
    collection.strings["hello"] = 13;
    collection.strings[foo] = 14;
    collection.strings["bar"] = 15;
  }
}

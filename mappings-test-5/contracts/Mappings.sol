pragma solidity ^0.5.0;

contract Mappings {
  struct Collection {
    mapping (uint256 => uint256) uints;
    mapping (string => uint256) strings;
    mapping (bytes3 => string) someBytes;
    mapping (bool => bytes) silly;
    mapping (address => int8) byAddress;
    //mapping (address payable => bytes) byAddressPayable;
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

    collection.someBytes[0xabcdef] = "hallo";
    collection.someBytes[0x123456] = "wooble";
    collection.someBytes[0x012345] = "what";

    collection.silly[true] = hex"0123456789abcdef";
    collection.silly[false] = hex"deadbeef";

    collection.byAddress[address(this)] = -1;

    //collection.byAddressPayable[address payable(this)] = 0x1337;
  }
}

contract NoStruct {
  mapping (uint256 => uint256) uints;
  mapping (string => uint256) strings;
  mapping (bytes3 => string) someBytes;
  //mapping (bool => bytes) silly;
  mapping (address => int8) byAddress;
  mapping (uint => bool) toBool;
  mapping (uint => bytes3) toBytes;
  mapping (uint => bytes) toMoreBytes;
  mapping (uint => string) oneString;
  mapping (bytes => int) fromBytes;

  bool toggle;
  bytes3 isolatedBytes;
  bytes manyIsolatedBytes;

  struct Pair { int x; int y;}

  Pair pair;

  function run() public {

    pair.x = 107;
    pair.y = 683;

    isolatedBytes = 0xabcdef;
    manyIsolatedBytes = hex"deadbeef";

    uint x = 1;
    uints[0] = 10;
    uints[x] = 11;
    uints[2] = 12;

    string memory foo = "foo";
    strings["hello"] = 13;
    strings[foo] = 14;
    strings["bar"] = 15;

    someBytes[0xabcdef] = "hallo";
    someBytes[0x123456] = "wooble";
    someBytes[0x012345] = "what";

    //silly[true] = hex"0123456789abcdef";
    //silly[false] = hex"deadbeef";

    byAddress[address(this)] = -1;

    toBytes[1] = 0xabcdef;

    toMoreBytes[1] = hex"deadbeefdeadbeef";

    oneString[1] = "I am a potato";

    fromBytes[hex"deadbeef"] = 3;

    toggle = true;
  }
}

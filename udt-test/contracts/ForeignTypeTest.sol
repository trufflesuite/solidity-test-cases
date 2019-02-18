pragma solidity ^0.5.4;

contract Contract1 {
  struct Struct1 {
    int i;
    bytes32 b;
  }

  enum Enum1 {
    huey, dewey, louie, phooey
  }

  Contract2.Struct2 struct21;
  Contract2.Enum2 enum21;
}

contract Contract2 {
  struct Struct2 {
    uint u;
    function () external fe;
    function () internal fi;
  }

  enum Enum2 {
    fox, falco, peppy, slippy
  }

  Contract1.Struct1 struct12;
  Contract1.Enum1 enum12;
}

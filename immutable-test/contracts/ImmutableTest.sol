//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract ImmutableTest {

  enum Ternary {
    Yes, No, MaybeSo
  }
  
  struct Pair {
    uint x;
    uint y;
  }
  
  //note: setting them here is legal!
  uint immutable konstant;
  int8 immutable signed;
  bool immutable verity = true;
  bytes1 immutable key;
  address immutable origin;
  ImmutableTest immutable self;
  Ternary immutable fact;
  function() internal immutable theThing;
  //function() external immutable universal; //not supported yet!

  event Uint(uint);
  event Int(int8);
  event Bool(bool);
  event Byte(bytes1);
  event Address(address);
  event Contract(ImmutableTest);
  event Enum(Ternary);
  event Function(function() external);

  function doStuff() public pure {
  }

  event String(string);

  constructor(string memory hi, uint8 x, bytes1 over, string memory bye) {
    konstant = uint(x) * 87;
    key = over >> 1;
    origin = address(this);
    self = this;
    fact = Ternary.MaybeSo;
    theThing = doStuff;
    signed = -1;
    emit String(hi);
    emit String(bye);
    emit Uint(konstant); //allowed on 0.8.8!
    emit Int(signed);
  }

  function run() public {
    emit Uint(konstant);
    emit Int(signed);
    emit Bool(verity);
    emit Byte(key);
    emit Address(origin);
    emit Contract(self);
    emit Enum(fact);
    theThing();
  }
}

pragma solidity ^0.6.5;

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
  bool immutable verity = true;
  byte immutable key;
  address immutable origin;
  ImmutableTest immutable self;
  Ternary immutable fact;
  function() internal immutable theThing;
  //function() external immutable universal; //not supported yet!

  event Uint(uint);
  event Bool(bool);
  event Byte(byte);
  event Address(address);
  event Contract(ImmutableTest);
  event Enum(Ternary);
  event Function(function() external);

  function doStuff() public pure {
  }

  event String(string);

  constructor(string memory hi, uint8 x, byte over, string memory bye) public {
    konstant = x * 87;
    key = over >> 1;
    origin = address(this);
    self = this;
    fact = Ternary.MaybeSo;
    theThing = doStuff;
    emit String(hi);
    emit String(bye);
  }

  function run() public {
    emit Uint(konstant);
    emit Bool(verity);
    emit Byte(key);
    emit Address(origin);
    emit Contract(self);
    emit Enum(fact);
    theThing();
  }
}

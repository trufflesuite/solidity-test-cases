pragma solidity ^0.6.7;

contract Tester1 {

  enum Unit { unit }

  constructor() public {
  }

  function directRevertNoReason() public {
    revert();
  }

  function directRevertWithReason() public {
    revert("Nope!");
  }

  function fail() public {
    assert(false);
  }

  function badCast() public returns (Unit) {
    return Unit(1);
  }

  function divideByZero() public returns (uint) {
    uint x = 0;
    return 1/x;
  }

  function notPayable() public {
  }

  function selfDestructed() public {
    Boom boom = new Boom();
    boom.boom();
  }

  function revertedCall() public {
    this.directRevertNoReason();
  }

  function revertedCallWithReason() public {
    this.directRevertWithReason();
  }

  function invalidCall() public {
    this.fail();
  }

  function revertedCreate() public {
    new CantMake();
  }

  function revertedCreateWithReason() public {
    new CantMakeWithReason();
  }

  function invalidCreate() public {
    new CantMakeInvalid();
  }

  function badEnum(Unit) public {
  }

  function badEnumReturns(Unit x) public returns (Unit) {
    return x;
  }

  function badEnumDecode() public returns (Unit) {
    (Unit x) = abi.decode(hex"00000000000000000000000000000001", (Unit));
    return x;
  }

  function badBool(bool) public {
  }

  function badBoolReturns(bool x) public returns (bool) {
    return x;
  }

  function badBoolDecode() public returns (bool) {
    (bool x) = abi.decode(hex"00000000000000000000000000000002", (bool));
    return x;
  }

  function badUint8(uint8) public {
  }

  function badUint8Returns(uint8 x) public returns (uint8) {
    return x;
  }

  function badUint8Decode() public returns (uint8) {
    (uint8 x) = abi.decode(hex"00000000000000000000000000000100", (uint8));
    return x;
  }

  function tooShortMemory(uint[] memory) public {
  }

  function tooShortCalldata(uint[] calldata) external {
  }

  function tooShortMemoryReturns(uint[] memory x) public returns (uint[] memory) {
    return x;
  }

  function tooShortCalldataReturns(uint[] calldata x) external returns (uint[] memory) {
    return x;
  }

  function tooShortDecode() public returns (uint[] memory) {
    (uint[] memory x) = abi.decode(hex"", (uint[]));
    return x;
  }
}

contract Tester2 {
  fallback() external {
  }

  function notCalled() public payable {
  }
}

contract Boom {
  function boom() public returns (uint) {
    selfdestruct(address(this));
  }

  fallback() external payable {
  }
}

contract CantMake {
  constructor() public {
    revert();
  }
}

contract CantMakeWithReason {
  constructor() public {
    revert();
  }
}

contract CantMakeInvalid {
  constructor() public {
    assert(false);
  }
}

library Tester3 {
  function run() external {
  }
}

//what, other than revert() and require(),
//can cause a revert? (hopefully these are
//reverts and not INVALIDs)
//not sure if this is comprehensive, but...
//0. direct use of revert() or require()
//0A. without a reason
//0B. with a reason
//1. uncaught exception from external call
//1A. uncaught exception from external function call
//1B. uncaught exception from external constructor call
//2. direct call to library function
//3. call w/no matching function, no fallback
//4. ether paid to nonpayable function
//5. ether paid to nonpayable fallback function
//6. ether paid to nonpayable constructor
//7. external call w/a return value self-destructs instead
//8. divide by zero
//9. overlarge cast to enum
//10. maybe: call with bad data?
//10A. overlarge enums
//10B. booleans not zero or one
//10C. forced to read past end of calldata/code??
//11. all of #10, but with abi.decode explicitly

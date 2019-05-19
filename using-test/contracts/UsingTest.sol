pragma solidity ^0.5.8;

contract UsingTest {
  using UsingLib for *;

  uint result0;
  uint result1;
  uint result2;
  uint result3;

  function run() public {
    uint isAUint = 8;
    //uint8 notABool = 2;
    bool isABool = true;
    //uint8 notAnEnum = 3;
    UsingLib.Ternary isAnEnum = UsingLib.Ternary.MaybeSo;
    //uint64 notAFn = 1 << 32;
    function() internal returns (uint) isAFn = one;

    result0 = isAUint.shouldWorkFn();
    //result1 = notABool.boolFn();
    result1 = isABool.boolFn();
    //result2 = notAnEnum.enumFn();
    result2 = isAnEnum.enumFn();
    //result3 = notAFn.internalFn();
    result3 = isAFn.internalFn();
  }

  function one() internal pure returns (uint) {
    return 1;
  }
}

library UsingLib {
  function boolFn(bool self) external pure returns (uint) {
    return self ? 7 : 8;
  }

  enum Ternary { Yes, No, MaybeSo }

  function enumFn(Ternary self) external pure returns (uint) {
    if(self == Ternary.Yes) {
      return 9;
    }
    else if(self == Ternary.No) {
      return 10;
    }
    else {
      return 37;
    }
  }

  function internalFn(function() internal returns (uint) self) internal returns (uint) {
    return self();
  }

  function shouldWorkFn(uint self) external pure returns (uint) {
    return self + 3;
  }
}

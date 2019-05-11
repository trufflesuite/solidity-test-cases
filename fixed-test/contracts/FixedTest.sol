pragma solidity ^0.5.8;

contract FixedTest {
  uint storedInteger;
  fixed storedFraction;

  struct mixedNumber {
    uint structInteger;
    fixed structFraction;
  }

  uint[] storedIntegerArray;
  fixed[] storedFractionArray;

  mapping(string => uint) integerMapping;
  mapping(string => fixed) fractionMapping;

  mapping(uint => string) integerKeyMapping;
  mapping(fixed => string) fractionKeyMapping;

  function run(uint inputInteger, fixed inputFraction) internal returns (uint outputInteger, fixed outputFraction) {
    uint localInteger;
    fixed localFraction;

    uint[] memory localIntegerArray;
    fixed[] memory localFractionArray;

    mapping(string => uint) storage integerMappingPointer = integerMapping;
    mapping(string => fixed) storage fractionMappingPointer = fractionMapping;
  }
}

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

library WeirdTypesLib {

  //first, some non-weird types
  function nullary() external view {
  }

  function takesUint(uint) external view {
  }

  function takesString(string calldata) external view {
  }

  function takesAddress(address) external view {
  }

  //now, some library-only types
  function takesStorage(string storage) external view {
  }

  function takesMapping(mapping(string => string) storage) external view {
  }

  //now, some types that usually get collapsed
  function takesAddressPayable(address payable) external view {
  }

  function takesFunction(function() external) external view {
  }
  
  function takesPureFunction(function(uint) external pure returns (uint)) external view {
  }

  //now, some user-defined types
  enum Ternary { Yes, No, MaybeSo }

  struct Pair {
    uint x;
    uint y;
  }

  struct Tree {
    uint x;
    Tree[] children;
  }

  type MyInt is int8;

  function takesContract(LibrarySelectorTest) external view {
  }

  function takesEnum(Ternary) external view {
  }

  function takesStruct(Pair calldata) external view {
  }

  function takesCustom(MyInt) external view {
  }

  //now, user-defined types w/storage!
  function takesStorageStruct(Pair storage) external view {
  }

  function takesStorageOnlyStruct(Tree storage) external view {
  }

  //and, user-defined or collapsible types with mappings!
  function takesMappingToStruct(mapping(string => Pair) storage) external view {
  }

  function takesMappingToEnum(mapping(string => Ternary) storage) external view {
  }

  function takesMappingToPayable(mapping(string => address payable) storage) external view {
  }

  function takesMappingToContract(mapping(string => LibrarySelectorTest) storage) external view {
  }

  function takesMappingToFunction(mapping(string => function() external) storage) external view {
  }

  //and with arrays!
  function takesStorageStructArray(Pair[] storage) external view {
  }

  function takesStorageEnumArray(Ternary[] storage) external view {
  }

  function takesStoragePayableArray(address payable[] storage) external view {
  }

  function takesStorageContractArray(LibrarySelectorTest[] storage) external view {
  }

  function takesStorageFunctionArray(function() external[] storage) external view {
  }

  //and with non-storage arrays!
  function takesStructArray(Pair[] calldata) external view {
  }

  function takesEnumArray(Ternary[] calldata) external view {
  }

  function takesPayableArray(address payable[] calldata) external view {
  }

  function takesContractArray(LibrarySelectorTest[] calldata) external view {
  }

  function takesFunctionArray(function() external[] calldata) external view {
  }

  //and finally...
  function IHopeThisGoesLast() external {
  }
}

contract LibrarySelectorTest {
  function run() public {
    WeirdTypesLib.IHopeThisGoesLast(); //let's just go with this I guess?
  }

  function runTakesCustom() public {
    WeirdTypesLib.takesCustom(WeirdTypesLib.MyInt.wrap(-1));
  }
}

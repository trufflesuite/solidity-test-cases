pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

library WeirdTypesLib {

  //first, some non-weird types
  function nullary() external {
  }

  function takesUint(uint) external {
  }

  function takesString(string calldata) external {
  }

  function takesAddress(address) external {
  }

  //now, some library-only types
  function takesStorage(string storage) external {
  }

  function takesMapping(mapping(string => string) storage) external {
  }

  //now, some types that usually get collapsed
  function takesAddressPayable(address payable) external {
  }

  function takesFunction(function() external) external {
  }
  
  function takesPureFunction(function(uint) external pure returns (uint)) external {
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

  function takesContract(LibrarySelectorTest) external {
  }

  function takesEnum(Ternary) external {
  }

  function takesStruct(Pair calldata) external {
  }

  //now, user-defined types w/storage!
  function takesStorageStruct(Pair storage) external {
  }

  function takesStorageOnlyStruct(Tree storage) external {
  }

  //and, user-defined or collapsible types with mappings!
  function takesMappingToStruct(mapping(string => Pair) storage) external {
  }

  function takesMappingToEnum(mapping(string => Ternary) storage) external {
  }

  function takesMappingToPayable(mapping(string => address payable) storage) external {
  }

  function takesMappingToContract(mapping(string => LibrarySelectorTest) storage) external {
  }

  function takesMappingToFunction(mapping(string => function() external) storage) external {
  }

  //and with arrays!
  function takesStorageStructArray(Pair[] storage) external {
  }

  function takesStorageEnumArray(Ternary[] storage) external {
  }

  function takesStoragePayableArray(address payable[] storage) external {
  }

  function takesStorageContractArray(LibrarySelectorTest[] storage) external {
  }

  function takesStorageFunctionArray(function() external[] storage) external {
  }

  //and finally...
  function IHopeThisGoesLast() external {
  }
}

contract LibrarySelectorTest {
  function run() public {
    WeirdTypesLib.IHopeThisGoesLast(); //let's just go with this I guess?
  }
}

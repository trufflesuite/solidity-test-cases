pragma solidity ^0.5.5;
pragma experimental ABIEncoderV2;

contract GetterTest {

  struct Pair {
    uint x;
    uint y;
  }

  struct HasArray {
    bytes32 x;
    uint[] xs;
  }

  struct HasStruct {
    bytes32 x;
    Pair xs;
  }

  struct HasMapping {
    bytes32 x;
    mapping(string => uint) xs;
  }

  //trivial case
  uint public simple; //takes nothing, returns uint
  //let's try a string
  string public maybeMemory; //takes nothing, returns string memory
  //static array
  uint[2] public staticArray; //takes uint, returns uint
  //dynamic array
  uint[] public dynamicArray; //same
  //mapping
  mapping(string => uint) public stringMapping; //takes string memory, returns uint
  //simple struct
  Pair public simpleStruct; //takes nothing, returns tuple of uints (!)
  //now let's try combining the above!
  //array-in-array
  uint[][] public arrayArray; //takes two uints, returns uint
  //array-in-mapping
  mapping(string => uint[]) public arrayMapping; //takes string memory & uint, returns uint
  //mapping-in-array
  mapping(string => uint)[] public mappingArray; //takes uint & string memory, returns uint
  //mapping-in-mapping
  mapping(string => mapping(string => uint)) public mappingMapping; //takes 2 strings memory, returns uint
  //struct-in-array
  Pair[] public structArray; //takes uint, returns two uints
  //struct-in-mapping
  mapping(string => Pair) public structMapping; //takes string memory, returns two uints
  //array-in-struct
  HasArray public arrayStruct; //ARRAY IS OMITTED (!)
  //struct-in-struct
  HasStruct public structStruct; //returns bytes32 and Pair memory (!)
  //mapping-in-struct
  HasMapping public mappingStruct; //MAPPING IS OMITTED (!)
  //now let's try constants
  uint constant public three = 3; //works fine as expected
  //Q: can we use a constant getter in another constant?
  //uint constant public five = this.three() + 2; //as expected, no

  function run() public view {
    this.simple;
    this.maybeMemory;
    this.staticArray;
    this.dynamicArray;
    this.stringMapping;
    this.simpleStruct;
    this.three;

    this.arrayArray;
    this.arrayMapping;
    this.mappingArray;
    this.mappingMapping;
    this.structArray;
    this.structMapping;
    this.arrayStruct;
    this.structStruct;
    this.mappingStruct;
  }
}

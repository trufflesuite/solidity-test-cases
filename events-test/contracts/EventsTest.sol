pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

contract EventsTest {

  enum Ternary { Yes, No, MaybeSo }

  struct Pair { uint x; uint y; }

  struct Circular { Circular[] l; }
  
  event takesUint(uint);
  event takesUint8(uint8);
  event takesInt(int);
  event takesInt8(int8);
  event takesBool(bool);
  event takesAddress(address);
  event takesContract(EventsTest);
  //event takesBytes(bytes memory);
  event takesBytes(bytes);
  event takesBytes32(bytes32);
  event takesByte(byte);
  event takesEnum(Ternary);
  //event takesString(string memory);
  event takesString(string);
  event takesFunction(function() external);
  //event takesFunctionInternal(function() internal);
  //event takesArray(uint[] memory);
  event takesArray(uint[]);
  //event takesStaticArray(uint[2] memory);
  event takesStaticArray(uint[2]);
  //event takesStorage(bytes storage);
  //event takesStruct(Pair memory);
  event takesStruct(Pair);
  //event takesMapping(mapping(uint => uint) storage);
  //event takesMapping(mapping(uint => uint));
  event takesFixed(fixed);
  event takesBigFixed(fixed256x80);
  //event takesCircular(Circular memory);
  //event takesCircular(Circular);

  function logStuff() public {

    uint[] memory arr = new uint[](3);
    arr[0] = 1;
    arr[1] = 2;
    arr[2] = 49;

    emit takesUint(3);
    emit takesUint8(3);
    emit takesInt(-1);
    emit takesInt8(-1);
    emit takesBool(true);
    emit takesAddress(address(this));
    emit takesContract(this);
    emit takesBytes(hex'abcdef');
    emit takesByte(0xfe);
    emit takesEnum(Ternary.MaybeSo);
    emit takesString("hello");
    //emit takesFunction(this.logStuff); //this works, but web3 currently can't handle it
    emit takesArray(arr);
    emit takesStaticArray([uint(3), 70]);
    emit takesStruct(Pair(40, 6));
  }

  function causeProblems() public {
    emit takesFunction(this.causeProblems);
  }
}

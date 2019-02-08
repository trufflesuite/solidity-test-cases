pragma solidity ^0.5.0;

contract CalldataTest {

  //value types: bool, int8-int256, uint8-uint256, address, address payable,
  //contract types, bytes1-bytes32, Enums
  //NOT SUPPORTED YET: fixed, ufixed
  //reference types: bytes, string, A[n], A[], mappings
  //(also w/location but I'm leaving that out)
  //are value types w/ a storage location reference types rather than value?
  //Structs are... what exactly?
  //function types: [not listing, you know how these work]

  //NOTE: compare what references look like for internal pure functions!

  struct Point {
    uint x;
    uint y;
  }

  uint num = 107;
  uint[3] nums = [2, 3, 5];
  uint[] moreNums = [0, 1, 2, 3, 4, 5, 6, 7];
  bytes3 someBytes = 0xABCDEF;
  string hello = "hello world!";
  Point loc;

  //uint oeInt; //nope
  uint oeArrayFixed;
  uint oeArray;
  //uint oeBytesFixed; //nope
  uint oeString;
  //uint oeStruct; //v2 only

  uint oiInt;
  uint oiArrayFixed;
  uint oiArray;
  uint oiBytesFixed;
  uint oiString;
  uint oiStruct;

  constructor() public
  {
    loc.x = 22;
    loc.y = 44;
  }

  function run() public
  {
    oiInt = sTakesInt(num);
    oiArrayFixed = mTakesArrayFixed(nums);
    oiArray = mTakesArray(moreNums);
    oiBytesFixed = sTakesBytesFixed(someBytes);
    oiString = mTakesString(hello);
    oiStruct = mTakesStruct(loc);

    //oeInt = this.takesInt(num); //nope
    oeArrayFixed = this.takesArrayFixed(nums);
    oeArray = this.takesArray(moreNums);
    //oeBytesFixed = this.takesBytesFixed(someBytes); //nope
    oeString = this.takesString(hello);
    //oeStruct = this.takesStruct(loc); //v2 only
  }

  //calldata

  /* illegal! is value and can't go in calldata (!)
  function takesInt(uint calldata x) external pure returns (uint)
  {
    return x + 1;
  }
  */

  function takesArrayFixed(uint[3] calldata arr) external pure returns (uint)
  {
    return arr[0];
  }

  function takesArray(uint[] calldata arr) external pure returns (uint)
  {
    return arr.length;
  }

  /* illegal! is value and can't go in calldata (!)
  function TakesBytesFixed(bytes3 calldata arr) external pure returns (uint)
  {
    return uint(uint8(arr[0]));
  }
  */

  function takesString(string calldata s) external pure returns (uint)
  {
    return bytes(s).length;
  }

  /* illegal! calldata struct requires encoder v2
  function takesStruct(Point calldata p) external pure returns (uint)
  {
    return p.x + p.y;
  }
  */

  //memory -- identical to above, but also allows struct

  /* illegal! is value and can't go in memory (!)
  function mTakesInt(uint memory x) internal pure returns (uint)
  {
    return x + 1;
  }
  */

  function mTakesArrayFixed(uint[3] memory arr) internal pure returns (uint)
  {
    return arr[0];
  }

  function mTakesArray(uint[] memory arr) internal pure returns (uint)
  {
    return arr.length;
  }

  /* illegal! is value and can't go in memory (!)
  function mTakesBytesFixed(bytes3 memory arr) internal pure returns (uint)
  {
    return uint(uint8(arr[0]));
  }
  */

  function mTakesString(string memory s) internal pure returns (uint)
  {
    return bytes(s).length;
  }

  function mTakesStruct(Point memory p) internal pure returns (uint)
  {
    return p.x + p.y;
  }

  //stack -- DISJOINT FROM ABOVE

  function sTakesInt(uint x) internal pure returns (uint)
  {
    return x + 1;
  }

  /* illegal! is reference and can't go on stack
  function sTakesArrayFixed(uint[3] arr) internal pure returns (uint)
  {
    return arr[0];
  }
  */

  function sTakesBytesFixed(bytes3 arr) internal pure returns (uint)
  {
    return uint(uint8(arr[0]));
  }

  /* illegal! is reference and can't go on stack
  function sTakesStruct(Point p) internal pure returns (uint)
  {
    return p.x + p.y;
  }
  */
}

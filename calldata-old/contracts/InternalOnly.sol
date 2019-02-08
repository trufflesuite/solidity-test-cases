pragma solidity ^0.4.25;

contract InternalOnly {

  struct Point {
    uint x;
    uint y;
  }

  uint num;
  uint[3] nums;
  uint[] moreNums;
  bytes3 someBytes;
  string hello;
  Point loc;

  uint oiInt;
  uint oiArrayFixed;
  uint oiArray;
  uint oiBytesFixed;
  uint oiString;
  uint oiStruct;

  function run() public
  {
    num = 107;
    nums = [2, 3, 5];
    moreNums = [0, 1, 2, 3, 4, 5, 6, 7];
    someBytes = 0xABCDEF;
    hello = "hello world!";
    loc.x = 22;
    loc.y = 44;

    oiInt = sTakesInt(num);
    oiArrayFixed = mTakesArrayFixed(nums);
    oiArray = mTakesArray(moreNums);
    oiBytesFixed = sTakesBytesFixed(someBytes);
    oiString = mTakesString(hello);
    oiStruct = mTakesStruct(loc);
  }

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

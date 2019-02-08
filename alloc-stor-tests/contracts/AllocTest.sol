pragma solidity ^0.5.0;

contract AllocTest {

  struct Pair { int x; int y; }
  struct BytePair { int8 x; int8 y; }

  Pair[] theArray;
  BytePair[] theOtherArray;
  /*
  int[2] arr;
  Pair pair1;
  Pair pair2;
  AllocTest contractTest;
  function(int8,int16) internal returns (int24,int32) internalTest;
  function(int8,int16) external returns (int24,int32) externalTest;
  int[2][3] arr2;
  Pair[5] arr3;
  int constant noVary = 82;
  */

  function run() public
  {
    /*
    pair1.x = 1;
    pair1.y = 2;
    pair2.x = 3;
    pair2.y = 4;
    */
    theArray.length = 3;
    theArray[0].x = 5;
    theArray[0].y = 6;
    theArray[1].x = 7;
    theArray[1].y = 8;

    theOtherArray.length = 3;
    theOtherArray[0].x = 5;
    theOtherArray[0].y = 6;
    theOtherArray[1].x = 7;
    theOtherArray[1].y = 8;
  }
}

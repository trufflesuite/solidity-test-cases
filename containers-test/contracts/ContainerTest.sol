pragma solidity ^0.5.3;

contract ContainersTest {

  //provides a nice ending point
  event Done();

  //declare needed structs
  struct Pair {
    uint x;
    uint y;
  }

  struct HasMap {
    uint x;
    mapping(string => string) map;
    uint y;
  }

  //declare storage variables to be tested
  Pair[] storageStructArray;
  uint128[4][] storageArrayArray;

  mapping(string => Pair) structMapping;
  mapping(string => uint128[4]) arrayMapping;

  mapping(string => int128) signedMapping;

  //this one is not tested directly
  uint[2] pointedAt;

  function run() public {

    //declare local variables to be tested
    uint[2] memory memoryStaticArray;
    HasMap memory memoryStructWithMap;
    uint[2] storage localStorage = pointedAt;

    //set up variables with values
    storageStructArray.length = 1;
    storageStructArray[0].x = 107;
    storageStructArray[0].y = 214;

    storageArrayArray.length = 1;
    storageArrayArray[0][0] = 2;
    storageArrayArray[0][1] = 3;
    storageArrayArray[0][2] = 7;
    storageArrayArray[0][3] = 57;

    structMapping["hello"].x = 107;
    structMapping["hello"].y = 214;

    arrayMapping["hello"][0] = 2;
    arrayMapping["hello"][1] = 3;
    arrayMapping["hello"][2] = 7;
    arrayMapping["hello"][3] = 57;

    signedMapping["hello"] = -1;

    memoryStaticArray[0] = 107;
    memoryStaticArray[1] = 214;

    memoryStructWithMap.x = 107;
    memoryStructWithMap.y = 214;

    //for this one, let's mix how we access it
    localStorage[0] = 107;
    pointedAt[1] = 214;

    //everything's set up, time to decode!
    emit Done(); //break here (71)
  }
}

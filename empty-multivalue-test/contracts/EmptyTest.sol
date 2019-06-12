pragma solidity ^0.4.25;

contract EmptyTest {
  struct EmptyStruct {
  }

  int128 preStructBarrier;
  EmptyStruct emptyStructStorage;
  int128 postStructBarrier;
  uint midBarrier;
  int128 preArrayBarrier;
  byte[0] emptyArrayStorage;
  int128 postArrayBarrier;

  function run() public {
    preStructBarrier = -1;
    postStructBarrier = -1;
    midBarrier = 1;
    preArrayBarrier = -1;
    postArrayBarrier = -1;

    uint[0] memory static1;
    uint[0] memory static2;
    uint[1] memory actualInt;
    actualInt[0] = 1;
  }
}

contract MultiEmptyTest {
  int128 preBarrier;
  byte[0][3] multiEmpty;
  int128 postBarrier;

  function run() public {
    preBarrier = -1;
    postBarrier = -1;

    int[1] memory preBarrierMem;
    preBarrierMem[0] = -1;
    byte[0][3] memory multiEmptyMem;
    int[1] memory postBarrierMem;
    postBarrierMem[0] = -1;
  }
}

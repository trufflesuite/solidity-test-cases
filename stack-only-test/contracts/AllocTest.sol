pragma solidity ^0.5.3;

contract AllocTest {

  event Done();

  function stackTest(int8 x, int8 y, int8 z) public returns (int8 a, int8 b, int8 c)
  {
    int8 w;
    w = -16;
    a = x + w;
    b = y + w;
    c = z + w;
    emit Done();
  }

  function complexStackTest(int lowValue, bytes calldata byteString, int[2] calldata lengthOne, int[] calldata lengthTwo, function() external fun, int highValue) external
  {
    emit Done();
  }

  function complexStackTester() public
  {
    bytes memory deadbeef = hex"deadbeef";
    int[2] memory twoInts;
    twoInts[0] = 1;
    twoInts[1] = 2;
    int[] memory manyInts;
    manyInts = new int[](1);
    manyInts[0] = 37;
    this.complexStackTest(47, deadbeef, twoInts, manyInts, this.complexStackTester, 99);
  }
}

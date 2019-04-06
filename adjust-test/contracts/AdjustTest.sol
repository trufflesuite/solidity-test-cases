pragma solidity ^0.5.7;

contract AdjustTest {

  mapping(uint => uint) map;

  function run() public returns (uint) {
    (uint x, uint y) = (3, 5);
    uint z = 3 + 5;
    uint w = 35;
    uint[] memory c;
    c = new uint[](2);
    mapping(uint => uint) storage localMap = map;
    localMap[5] = 8;
    return x + y + z + w + c.length;
  }
}

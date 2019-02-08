pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract CalldataMappingStructTest {
  struct MappingStruct {
    uint x;
    uint y;
  }

  function test(MappingStruct calldata mappingStruct) external returns (uint)
  {
    return mappingStruct.x + mappingStruct.y;
  }
}

pragma solidity ^0.5.0;

contract PreallocTest {

  event Done();

  struct InnerStruct {
    uint8 x;
    uint8 y;
  }

  struct MiddleStruct {
    InnerStruct x;
    InnerStruct y;
  }

  struct OuterStruct {
    MiddleStruct x;
    MiddleStruct y;
  }

  OuterStruct outerStruct;

  function SSS() public {
    outerStruct.x.x.x = 1;
    outerStruct.x.x.y = 2;
    outerStruct.x.y.x = 3;
    outerStruct.x.y.y = 4;
    outerStruct.y.x.x = 5;
    outerStruct.y.x.y = 6;
    outerStruct.y.y.x = 7;
    outerStruct.y.y.y = 8;
    emit Done();
  }

  struct ArrayStruct {
    uint8[2] x;
    uint8[2] y;
  }

  ArrayStruct arrayStruct;
  InnerStruct[2] structArray;

  function SA() public {
    structArray[0].x = 1;
    structArray[0].y = 2;
    structArray[1].x = 3;
    structArray[1].y = 4;
    emit Done();
  }

  function AS() public {
    arrayStruct.x[0] = 1;
    arrayStruct.x[1] = 2;
    arrayStruct.y[0] = 3;
    arrayStruct.y[1] = 4;
    emit Done();
  }

  struct MappingStruct {
    mapping(uint => uint) x;
    mapping(uint => uint) y;
  }

  MappingStruct mappingStruct;
  mapping(uint => InnerStruct) structMapping;

  function SM() public {
    structMapping[0].x = 1;
    structMapping[0].y = 2;
    structMapping[1].x = 3;
    structMapping[1].y = 4;
    emit Done();
  }

  function MS() public {
    mappingStruct.x[0] = 1;
    mappingStruct.x[1] = 2;
    mappingStruct.y[0] = 3;
    mappingStruct.y[1] = 4;
  }
}

contract ConstAndBase {

  event Done();

  uint8 constant ONE = 1;
  uint8 two;
  uint8 constant THREE = 3;
  uint8 four;
  uint8 constant FIVE = 5;
}

contract ConstAndDerived is ConstAndBase {
  uint8 constant SIX = 6;
  uint8 seven;
  uint8 constant EIGHT = 8;
  uint8 nine;
  uint8 constant TEN = 10;

  function run() public {
    two = 2;
    four = 4;
    seven = 7;
    nine = 9;
    emit Done();
  }
}

contract EnumTest {
  event Done();

  enum Sign { Plus, Zero, Minus }

  Sign storageSign;

  function run() public {
    Sign stackSign;
    Sign[2] memory memorySigns;
    stackSign = Sign.Minus;
    storageSign = Sign.Minus;
    memorySigns[0] = Sign.Minus;
    memorySigns[1] = Sign.Minus;
    emit Done();
  }
}

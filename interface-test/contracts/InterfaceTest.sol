pragma solidity ^0.5.0;

interface TestInterface {
  function doThingI(uint) external returns (uint);
}

contract TestAbstract {
  function doThingA(uint) public returns (uint);
}

contract TestConcrete is TestAbstract, TestInterface {
  function doThingI(uint x) external returns (uint) {
    return x + 3;
  }

  function doThingA(uint x) public returns (uint) {
    return x * 3;
  }

  function doThingC(uint x) public returns (uint) {
    return x + 9;
  }
}

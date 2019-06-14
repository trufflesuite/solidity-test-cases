pragma solidity 0.4.17;

contract UnaryPlusTest {
  mapping(uint => uint) theMap;

  function run(uint x) public {
    theMap[+1] = 1;
    theMap[+x] = x;
  }
}

pragma solidity ^0.6.6;

contract InternalTest {

  uint[][] list;

  function run() public {
    list.push(new uint[](0));
    list[0] = [2, 3];
    delete list;
    uint[][] memory mem = list;
    bytes memory str = type(Sink).creationCode;
  }
}

contract Sink {
  constructor() public payable {
  }
  fallback() external payable {
  }
}

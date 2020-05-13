pragma solidity ^0.6.7;

contract CreateReturnTest {

  function run() public {
    new Sink();
    assembly {
      let length := returndatasize() //zero! creates don't put the bytecode in returndata, apparently
      returndatacopy(0x80, length, 0)
      log0(0x80, length)
    }
  }
}

contract Sink {
  constructor() public payable {
  }
  fallback() external payable {
  }
}

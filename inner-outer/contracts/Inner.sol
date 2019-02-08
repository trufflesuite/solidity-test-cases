pragma solidity ^0.4.18;


contract Inner {
  
  uint8 flag;

  constructor() public {
    flag = 0;
  }
  
  function run() public {
    flag = 1;
  }

  function runExt() external {
    flag = 1;
  }

  function() public payable {
  }
}

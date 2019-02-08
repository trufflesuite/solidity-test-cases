pragma solidity ^0.5.1;


contract Inner {
  
  uint8 flag;

  constructor() public {
    flag = 0;
  }
  
  function run() public {
    flag = 1;
  }

  function runArgs(int x, int y) public returns (int u, int v, int w)
  {
    int z;
    z = x + y;
    u = z + z;
    v = z + u;
    w = z + v;
    flag = 1;
  }

  function runExt() external {
    flag = 1;
  }

  function() external payable {
  }
}

pragma solidity ^0.4.25;

import "./InterveningLib.sol";

contract Intervening {

  Inner inner;
  uint8 flag;

  constructor(address _inner) public {
    inner = Inner(_inner);
  }

  function run() public {
    flag = 0;
    inner.run();
    flag = 1;
  }

  function runLib() public {
    flag = 0;
    flag = InnerLib.run();
    flag = 1;
  }
}

contract Inner {
  
  uint8 flag;

  constructor() public {
    flag = 0;
  }
  
  function run() public {
    flag = 1;
  }
}


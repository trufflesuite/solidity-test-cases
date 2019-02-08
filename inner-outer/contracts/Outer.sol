pragma solidity ^0.4.18;

import "./Inner.sol";
import "./InnerLib.sol";

contract Outer {
  event Called();

  Inner inner;
  uint8 flag;

  constructor(address _inner) public {
    inner = Inner(_inner);
  }

  function runSingle() public {
  }

  function run() public {
    flag = 0;
    inner.run();
    flag = 1;
  }

  function runExt() public {
    flag = 0;
    inner.runExt();
    flag = 1;
  }

  function runDouble() public {
    this.runSingle();
  }

  function runSend() public {
    flag = 0;
    address(inner).send(0);
    flag = 1;
  }

  function runTransfer() public {
    flag = 0;
    address(inner).transfer(0);
    flag = 1;
  }

  function runNew() public {
    flag = 0;
    Inner inner2 = new Inner();
    flag = 1;
  }

  function runLib() public {
    flag = 0;
    InnerLib.run();
    flag = 1;
  }
}

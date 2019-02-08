pragma solidity ^0.4.18;

import "./Inner.sol";
import "./InnerLib.sol";

contract OuterAddress {

  address inner;
  uint8 flag;

  constructor(address _inner) public {
    inner = _inner;
  }

  function run() public {
    flag = 0;
    inner.send(0);
    flag = 1;
  }
}

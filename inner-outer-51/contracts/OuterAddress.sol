pragma solidity ~0.5;

import "./Inner.sol";
import "./InnerLib.sol";

contract OuterAddress {

  address payable inner;
  uint8 flag;

  constructor(address payable _inner) public {
    inner = _inner;
  }

  function run() public {
    flag = 0;
    inner.send(0);
    flag = 1;
  }
}

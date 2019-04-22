pragma solidity ^0.5.7;

import "./Base.sol";

contract Derived is Base {
  event Done();
  function doThing() public {
    emit Done();
  }
}

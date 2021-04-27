//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error Unhelpful(uint);

contract RevertTest {

  event Here();

  error CalledBy(address);

  function local() public {
    emit Here();
    revert CalledBy(msg.sender);
  }

  function global() public {
    emit Here();
    revert Unhelpful(block.timestamp);
  }

  function foreign() public {
    emit Here();
    revert Aux.What(-1);
  }
}

contract Aux {
  error What(int);
}

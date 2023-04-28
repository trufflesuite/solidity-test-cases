//SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract Identity {

  function identity(address x) public pure returns (address) {
    return x;
  }

}

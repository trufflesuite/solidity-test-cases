//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Library {

  event Library2Event();

  function doStuff() external {
    emit Library2Event();
  }
}

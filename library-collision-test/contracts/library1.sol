//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Library {

  event Library1Event();

  function doStuff() external {
    emit Library1Event();
  }
}

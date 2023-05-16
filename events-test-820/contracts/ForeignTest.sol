//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract EmitsForeign {

  event Familiar();

  function run() public {
    emit Familiar();
    IsForeign foreign = new IsForeign();
    emit Familiar();
  }
}

contract IsForeign {

  event Foreign();

  constructor() {
    emit Foreign();
  }
}

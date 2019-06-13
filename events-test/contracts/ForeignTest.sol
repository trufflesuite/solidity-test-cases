pragma solidity ^0.5.9;

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

  constructor() public {
    emit Foreign();
  }
}

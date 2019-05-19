pragma solidity ^0.5.8;

contract RevertTest {
  NoBoom noboom;

  constructor(NoBoom it) public {
    noboom = it;
  }

  function run() public {
    noboom.boom();
    revert();
  }
}

contract NoBoom {

  event Done();

  function() external payable {
  }

  function boom() public {
    selfdestruct(address(this));
  }

  function run() public {
    emit Done();
  }
}

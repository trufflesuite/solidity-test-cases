pragma solidity ^0.5.8;

contract InvalidTest {
  function run() public {
    function() internal invalid;
    invalid();
  }
}

contract InvalidLibTest {
  function run() public {
    function() internal invalid;
    InvalidLib.receivesInternal(invalid);
  }

  function runExternal() public {
    InvalidLib.run();
  }
}

library InvalidLib {
  function receivesInternal(function() internal it) internal {
    it();
  }

  function run() external {
    function() internal invalid;
    receivesInternal(invalid);
  }
}

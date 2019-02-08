pragma solidity ^0.5.1;

contract AssertFalseTest {
  function fail() pure public {
    assert(false);
  }

  function jump(function() internal fn) internal {
    fn();
  }

  function doIt() public {
    function() internal blind;
    jump(blind);
  }
}

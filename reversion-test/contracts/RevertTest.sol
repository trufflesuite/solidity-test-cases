pragma solidity ^0.5.6;

contract RevertTest {

  uint x;
  uint y;

  function() external {
    x = 2;
    revert();
  }

  function run() public {
    x = 1;
    address(this).call(hex"");
    y = x;
  }
}

pragma solidity ^0.6.0;

contract TwoTest {

  uint8 x;

  function twoTest(string calldata s, uint[1] calldata it) external {
    function(string memory, uint[1] memory) external fn = this.twoTest;
    assembly {
      log1(0, 0, it)
      log1(0, 0, x_slot)
      log1(0, 0, x_offset)
      /*
      log1(0, 0, x)
      log1(0, 0, s)
      log1(0, 0, s_length)
      log1(0, 0, fn)
      log1(0, 0, fn_address)
      log1(0, 0, fn_selector)
      */
    }
  }
}

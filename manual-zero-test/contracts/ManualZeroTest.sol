pragma solidity ^0.5.7;

contract ManualZeroTest {

  bool status;
  bytes result;

  function run() public {
    address zero = 0x0000000000000000000000000000000000000000;
    (status, result) = zero.call(hex"7f602a60005360016000f300000000000000000000000000000000000000000000600052600a6000f3");
  }

  function nonzeroRun() public {
    address nonzero = 0x9999999999999999999999999999999999999999;
    (status, result) = nonzero.call(hex"7f602a60005360016000f300000000000000000000000000000000000000000000600052600a6000f3");
  }
}

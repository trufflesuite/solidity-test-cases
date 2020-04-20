pragma solidity ^0.6.6;

contract ManualZeroTest {

  bool status;
  bytes result;

  bytes constant public code = hex"7f602a60005360016000f300000000000000000000000000000000000000000000600052600a6000f3";
  bytes constant public runOff = hex"6000";
  bytes constant public pushRunOff = hex"60";
  bytes constant public returnRunOff = hex"7f600000000000000000000000000000000000000000000000000000000000000060005260016000f3";
  bytes constant public returnPushRunOff = hex"7f600000000000000000000000000000000000000000000000000000000000000060005260006000f3";

  function run() public {
    address zero = 0x0000000000000000000000000000000000000000;
    (status, result) = zero.call(code);
  }

  function nonzeroRun() public {
    address nonzero = 0x9999999999999999999999999999999999999999;
    (status, result) = nonzero.call(code);
  }

  function inputRun(address input) public {
    (status, result) = input.call(code);
  }

  function genericCreateAndRun(bytes memory makeCode) public {
    address it;
    assembly {
      it := create(0, add(makeCode, 0x20), mload(makeCode))
    }
    (status, result) = it.call(code);
  }

  function createAndRun() public {
    genericCreateAndRun(hex"00");
  }

  function noCreateAndRun() public {
    genericCreateAndRun(hex"");
  }

  function createTwice() public {
    bytes32 salty = 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;
    new Sink{salt: salty}();
    try new Sink{salt: salty}() {
    } catch (bytes memory) {
    }
  }
}

contract Sink {
  constructor() public payable {
  }
  fallback() external payable {
  }
}

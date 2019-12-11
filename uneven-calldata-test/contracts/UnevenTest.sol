pragma solidity ^0.5.14;

contract UnevenTest {

  event Show(bytes);

  function run() public {
    address(this).call(hex"face");
    address(this).call(hex"deadbeefdeadbeef");
  }

  function() external {
    emit Show(msg.data);
  }
}

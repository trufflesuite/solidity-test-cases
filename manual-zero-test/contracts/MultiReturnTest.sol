pragma solidity ^0.6.6;

contract MultiReturnTest {

  bytes constant public runOff = hex"5b";
  bytes constant public callRunOff = hex"60008080808080355af1";
  bytes constant public returnRunOff = hex"7f5b0000000000000000000000000000000000000000000000000000000000000060005260016000f3";
  bytes constant public returnCallRunOff = hex"7f60008080808080355af100000000000000000000000000000000000000000000600052600a6000f3";

  event CallReturn(bool, bytes);

  function make(bytes memory makeCode) public returns (address) {
    address it;
    assembly {
      it := create(0, add(makeCode, 0x20), mload(makeCode))
    }
    return it;
  }

  function run() public {
    address level2 = make(returnRunOff);
    address level1 = make(returnCallRunOff);
    (bool status, bytes memory message) = level1.call(abi.encode(level2));
    emit CallReturn(status, message);
  }
}

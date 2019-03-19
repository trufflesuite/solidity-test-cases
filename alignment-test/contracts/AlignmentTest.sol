pragma solidity ^0.5.3;

contract AlignmentTest
{

  event Done();

  bytes transit;

  function run() public
  {
    bytes memory rCode1 = type(Child).runtimeCode;
    byte[2] memory twoBytes;
    bytes memory rCode2 = type(Child).runtimeCode;
    byte[] memory manyBytes = new byte[](2);
    bytes memory rCode3 = type(Child).runtimeCode;
    bytes memory packedBytes = hex"000102030405060708090a0b0c0d0e0f000102030405060708090a0b0c0d0e0fdeadbeef";
    bytes memory rCode4 = type(Child).runtimeCode;
    byte[2] memory twoBytes2;
    bytes memory rCode5 = type(Child).runtimeCode;
    byte[] memory manyBytes2 = new byte[](2);
    bytes memory rCode6 = type(Child).runtimeCode;
    bytes memory packedBytes2 = hex"000102030405060708090a0b0c0d0e0f000102030405060708090a0b0c0d0e0fdeadbeef";
    bytes memory rCode7 = type(Child).runtimeCode;
    bytes memory packedBytes3 = hex"000102030405060708090a0b0c0d0e0f000102030405060708090a0b0c0d0e0fdeadbeef";
    bytes memory rCode8 = type(Child).runtimeCode;
    emit Done();
  }

  function receive(bytes calldata _cCode, bytes calldata _rCode, bytes calldata _dummy) external
  {
    bytes memory cCode = _cCode;
    bytes memory rCode = _rCode;
    bytes memory dummy = _dummy;
    emit Done();
  }

  function send() public
  {
    bytes memory cCode = type(Child).creationCode;
    bytes memory rCode = type(Child).runtimeCode;
    bytes memory dummy = hex"000102030405060708090a0b0c0d0e0f000102030405060708090a0b0c0d0e0fdeadbeef";
    this.receive(cCode, rCode, dummy);
  }

  function copy() public
  {
    bytes memory cCode = type(Child).creationCode;
    transit = cCode;
    bytes memory cCodeCopy = transit;
    string memory hello = "hello world!";
    emit Done();
  }

  function dataTest(string calldata it) external
  {
    bytes memory data = msg.data;
    string memory hello = "hello";
    string memory itCopy = it;
    string memory hello2 = "hello2";
    bytes memory empty;
    emit Done();
  }
}

contract Child
{
}

pragma solidity ^0.5.10;

contract EchoTest {

  function doNothing() public pure {
  }

  event EchoBool(bool);

  function echoBool(bool x) public {
    emit EchoBool(x);
  }

  event EchoFunction(function() external);

  function echoFunction(function() external f) public {
    emit EchoFunction(f);
  }

  event EchoBools(bool[]);

  function echoBools(bool[] memory x) public {
    emit EchoBools(x);
    bool extracted = x[0];
    emit EchoBool(extracted);
  }

  function echoBoolsNoCopy(bool[] calldata x) external {
    emit EchoBools(x);
    bool extracted = x[0];
    emit EchoBool(extracted);
  }

  event EchoBytes(byte[]);
  event EchoByte(byte);

  function echoBytes(byte[] memory x) public {
    emit EchoBytes(x);
    byte extracted = x[0];
    emit EchoByte(extracted);
  }

  function echoBytesNoCopy(byte[] calldata x) external {
    emit EchoBytes(x);
    byte extracted = x[0];
    emit EchoByte(extracted);
  }
}

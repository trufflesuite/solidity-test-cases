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

  enum Ternary {
    True,
    False,
    FileNotFound
  }

  event EchoEnums(Ternary[]);
  event EchoEnum(Ternary);

  function echoEnum(Ternary x) public {
    emit EchoEnum(x);
  }

  function echoEnumsOnly(Ternary[] memory x) public {
    emit EchoEnums(x);
  }

  function echoEnums(Ternary[] memory x) public {
    emit EchoEnums(x);
    Ternary extracted = x[0];
    emit EchoEnum(extracted);
  }

  function echoEnumsNoCopy(Ternary[] calldata x) external {
    emit EchoEnums(x);
    Ternary extracted = x[0];
    emit EchoEnum(extracted);
  }

  function echoEnumsNoCopyOnly(Ternary[] calldata x) external {
    emit EchoEnums(x);
  }
}

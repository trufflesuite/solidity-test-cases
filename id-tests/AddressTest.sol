pragma solidity ^0.4.25;

contract ConstructorTest {

  uint8 x;
  uint8 y;

  function run() public
  {
    SecretByte test1 = new SecretByte(107);
    SecretByte test2 = new SecretByte(46);
    x = test1.mangle();
    y = test2.mangle();
  }

contract SecretByte {

  uint8 private secret;

  constructor(uint8 n) public
  {
    secret = n;
  }

  function mangle() public view returns (uint8)
  {
    mangled = secret+1;
    return mangled;
  }
}

pragma solidity ^0.4.25;

contract PrecompileTest {

  uint flag;

  function run() public {
    flag = 0;
    sha256("hello world");
    flag = 1;
  }
}

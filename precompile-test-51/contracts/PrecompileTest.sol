pragma solidity ^0.5.1;

contract PrecompileTest {

  uint flag;

  function run() public {
    flag = 0;
    sha256("hello world");
    flag = 1;
  }
}

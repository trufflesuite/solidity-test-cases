pragma solidity ^0.5.10;

contract OverloadTest {

  event Uint(uint);

  event String(string);

  function run(uint x) public {
    emit Uint(x);
  }

  function run(string memory x) public {
    emit String(x);
  }
}

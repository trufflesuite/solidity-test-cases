pragma solidity ^0.5.11;

contract NumberFormatTest {

  uint public n;

  constructor(uint it) public {
    n = it;
  }

  event Echo(uint);

  function echo(uint k) public {
    emit Echo(k);
  }
}

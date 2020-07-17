pragma solidity ^0.5.16;

contract Base {
  event Bevent();
  function run() private {
    emit Bevent();
  }
}

contract Derived is Base {
  event Devent();
  function run() private {
    emit Devent();
  }
}

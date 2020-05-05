pragma solidity ^0.6.6;

contract Parent {
  event Num(uint);
  event Greeting(string);

  modifier greeter(uint x) {
    emit Greeting("Hello");
    emit Num(x);
    _;
    emit Greeting("Goodbye");
  }

  constructor(uint x) public greeter(4) greeter(5) {
    emit Num(x);
  }
}

contract StupidStuff is Parent {
  event Done();

  function run() public greeter(1) greeter(2) {
    emit Done();
  }

  constructor() public greeter(1) Parent(2) greeter(3) {
    emit Done();
  }

  fallback() external payable greeter(1) greeter(2) {
    emit Done();
  }

  receive() external payable greeter(1) greeter(2) {
    emit Done();
  }
}

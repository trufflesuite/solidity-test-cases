pragma solidity ^0.6.0;

contract DoubleInheritParent {
  event Start(uint);
  event End(uint);
  event Done();

  modifier modified(uint x) {
    emit Start(x);
    _;
    emit End(x);
  }

  constructor() public modified(3) modified(4) {
    emit Done();
  }
}

contract DoubleInheritChild is DoubleInheritParent {
  constructor() public modified(1) modified(2) {
    emit Done();
  }
}

pragma solidity ^0.6.6;


contract DepthTest5 {
  constructor(uint x) public {
    emit Num(x);
  }

  event Num(uint);
}

contract DepthTest4 is DepthTest5 {
  constructor(uint x) public DepthTest5(x + 1) {
    emit Num(x);
  }
}

contract DepthTest3 is DepthTest4(4) {
  constructor(uint x) public {
    emit Num(x);
  }
}

contract DepthTest2 is DepthTest3 {
  constructor(uint x) public DepthTest3(x + 1) {
    emit Num(x);
  }
}

contract DepthTest1 is DepthTest2 {
  constructor(uint x) public DepthTest2(x + 1) {
    emit Num(x);
  }
}

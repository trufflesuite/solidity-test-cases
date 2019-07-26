pragma solidity ^0.5.10;

contract E1 {
  event Name(string);

  uint e;

  constructor(uint _e) public {
    emit Name("E");
    e = _e;
  }
}

contract D1 is E1 {
  constructor(uint _d) public E1(_d) {
    emit Name("D");
  }

  function print() public {
    emit Name("DD");
  }
}

contract C1 {
  event Name(string);

  uint c;

  constructor(uint _c) public {
    emit Name("C");
    c = _c;
  }
}

contract B1 is C1 {
  constructor(uint _b) public C1(_b) {
    emit Name("B");
  }

  function print() public {
    emit Name("BB");
  }
}

contract A1 is D1, B1 {
  constructor(uint _a) public D1(_a) B1(_a) {
    emit Name("A");
    print();
  }
}

contract E2 {
  event Name(string);

  uint e;

  constructor(uint _e) public {
    emit Name("E");
    e = _e;
  }
}

contract D2 is E2 {
  constructor(uint _d) public E2(_d) {
    emit Name("D");
  }

  function print() public {
    emit Name("DD");
  }
}

contract C2 {
  event Name(string);

  uint c;

  constructor(uint _c) public {
    emit Name("C");
    c = _c;
  }
}

contract B2 is C2 {
  constructor(uint _b) public C2(_b) {
    emit Name("B");
  }

  function print() public {
    emit Name("BB");
  }
}

contract A2 is D2, B2 {
  constructor(uint _a) public B2(_a) D2(_a) {
    emit Name("A");
    print();
  }
}

pragma solidity ^0.5.0;

contract ComplexInheritanceTest {
  function run() public
  {
    Z test;
    test = new Z(10,9,8,7,6,5,4,3,2,1);
    test.workaround();
  }
}

//let's use Wikipedia's example; note that Solidity uses reverse order from
//Python, so the lists will be in reverse order compared to Wikipedia.

//Also note: We can't use base constructor calls here since solidity will
//complain if the same base constructor is called multiple times in the chain.
//so, instead we set things manually.

contract O {
  int o;

  event Done();

  constructor(int _o) public
  {
    o = _o;
  }

  function workaround() public
  {
    emit Done();
  }
}

contract A is O {
  int a;
  constructor(int _a, int _o) public
  {
    a = _a;
    o = _o;
  }
}

contract B is O {
  int b;
  constructor(int _b, int _o) public
  {
    b = _b;
    o = _o;
  }
}

contract C is O {
  int c;
  constructor(int _c, int _o)  public
  {
    c = _c;
    o = _o;
  }
}

contract D is O {
  int d;
  constructor(int _d, int _o) public
  {
    d = _d;
    o = _o;
  }
}

contract E is O {
  int e;
  constructor(int _e, int _o)  public
  {
    e = _e;
    o = _o;
  }
}

contract K1 is C, B, A {
  int k1;
  constructor(int _k1, int _a, int _b, int _c, int _o) public
  {
    k1 = _k1;
    a = _a;
    b = _b;
    c = _c;
    o = _o;
  }
}

contract K2 is E, B, D {
  int k2;
  constructor(int _k2, int _d, int _b, int _e, int _o) public
  {
    k2 = _k2;
    d = _d;
    b = _b;
    e = _e;
    o = _o;
  }
}

contract K3 is A, D {
  int k3;
  constructor(int _k3, int _d, int _a) public
  {
    k3 = _k3;
    d = _d;
    a = _a;
  }
}

contract Z is K3, K2, K1 {
  int z;
  constructor(int _z, int _k1, int _k2, int _k3, int _d, int _a, int _b, int _c, int _e, int _o) public
  {
    z = _z;
    k1 = _k1;
    k2 = _k2;
    k3 = _k3;
    d = _d;
    a = _a;
    b = _c;
    e = _e;
    o = _o;
  }
}

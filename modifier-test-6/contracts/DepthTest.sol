pragma solidity ^0.6.1;

contract DepthTest {
  event Dummy();

  event Body();

  event Integer(uint);

  event String(string);

  modifier dummy {
    emit Dummy();
    _;
    emit Dummy();
  }

  modifier twoInts(uint n, uint m) {
    emit Integer(n);
    _;
    emit Integer(m);
  }

  modifier twoStrings(string memory s, string memory t) {
    emit String(s);
    _;
    emit String(t);
  }

  modifier stringThenInt(string memory s, uint n) {
    emit String(s);
    _;
    emit Integer(n);
  }

  uint constant c = 3;
  uint constant k = 8;

  function twoIntsSimple() public dummy twoInts(3, 8) {
    emit Body();
  }

  function twoIntsConstant() public dummy twoInts(c, k) {
    emit Body();
  }

  function twoStringsSimple(string memory s, string memory t) public dummy twoStrings(s, t) {
    emit Body();
  }

  function twoStringsLiteral() public dummy twoStrings("hi", "bye") {
    emit Body();
  }

  function stringThenIntLiteralConstant() public dummy stringThenInt("trouble", c) {
    emit Body();
  }
}

contract GrandparentUpTop {
  uint store;
  constructor(uint x) public {
    store = x;
  }
}

contract ParentUpTop is GrandparentUpTop(5) {
  constructor() public {
    store++;
  }
}

contract ConstructorDepthTestUpTop is ParentUpTop {
  constructor() public {
    store *= 2;
  }
}

contract GrandparentDownBelow {
  uint store;
  constructor(uint x) public {
    store = x;
  }
}

contract ParentDownBelow is GrandparentDownBelow {
  constructor() public GrandparentDownBelow(5) {
    store++;
  }
}

contract ConstructorDepthTestDownBelow is ParentDownBelow {
  constructor(uint coeff) public {
    store *= coeff;
  }
}

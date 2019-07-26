pragma solidity ^0.5.10;

contract O {
  function run() public {
    emit Name("O");
  }

  event Name(string);
}

contract C is O {
  function run() public {
    emit Name("C");
    super.run();
  }
}

contract A is O {
  function run() public {
    emit Name("A");
    super.run();
  }
}

contract B is O {
  function run() public {
    emit Name("B");
    super.run();
  }
}

contract D is O {
  function run() public {
    emit Name("D");
    super.run();
  }
}

contract E is O {
  function run() public {
    emit Name("E");
    super.run();
  }
}

contract K1 is C, B, A {
  function run() public {
    emit Name("K1");
    super.run();
  }
}

contract K2 is E, B, D {
  function run() public {
    emit Name("K2");
    super.run();
  }
}

contract K3 is A, D {
  function run() public {
    emit Name("K3");
    super.run();
  }
}

contract Z is K3, K2, K1 {
  function run() public {
    emit Name("Z");
    super.run();
  }
}

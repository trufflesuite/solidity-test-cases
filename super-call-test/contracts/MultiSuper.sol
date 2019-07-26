pragma solidity ^0.5.10;

contract O {
  function run() public {
    emit Name("O");
  }

  function wayUpThere() public {
    emit Name("O");
  }

  function skips() public {
    emit Name("O");
  }

  event Name(string);
}

contract C is O {
  function run() public {
    emit Name("C");
    super.run();
  }

  function skips() public {
    emit Name("C");
    super.skips();
  }
}

contract A is O {
  function run() public {
    emit Name("A");
    super.run();
  }

  function skips() public {
    emit Name("A");
    super.skips();
  }
}

contract B is O {
  function run() public {
    emit Name("B");
    super.run();
  }

  function onlySome() public {
    emit Name("B");
  }
}

contract D is O {
  function run() public {
    emit Name("D");
    super.run();
  }

  function skips() public {
    emit Name("D");
    super.skips();
  }
}

contract E is O {
  function run() public {
    emit Name("E");
    super.run();
  }

  function skips() public {
    emit Name("E");
    super.skips();
  }
}

contract K1 is C, B, A {
  function run() public {
    emit Name("K1");
    function() internal toRun = super.run;
    toRun();
  }

  function onlySome() public {
    emit Name("K1");
    super.onlySome();
  }

  function skips() public {
    emit Name("K1");
    super.skips();
  }
}

contract K2 is E, B, D {
  function run() public {
    emit Name("K2");
    super.run();
  }

  function onlySome() public {
    emit Name("K2");
    super.onlySome();
  }

  function skips() public {
    emit Name("K2");
    super.skips();
  }
}

contract K3 is A, D {
  function run() public {
    emit Name("K3");
    super.run();
  }

  /* not allowed
  function onlySome() public {
    emit Name("K3");
    super.onlySome();
  }
  */

  function skips() public {
    emit Name("K3");
    super.skips();
  }
}

contract Z is K3, K2, K1 {
  function run() public {
    emit Name("Z");
    super.run();
  }

  function notRun() public {
    emit Name("Z");
    K1.run();
  }

  function wayUpThere() public {
    emit Name("Z");
    super.wayUpThere();
  }

  function skips() public {
    emit Name("Z");
    super.skips();
  }
}

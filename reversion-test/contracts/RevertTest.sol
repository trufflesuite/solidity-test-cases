pragma solidity ^0.5.6;

contract RevertTest {

  uint x;
  uint y;

  PreExisting pre;

  function() external {
    x = 2;
    y = x;
    revert();
  }

  function run() public {
    x = 1;
    address(this).call(hex"");
    y = x;
  }

  function setup() public {
    pre = new PreExisting();
  }

  function runPre() public {
    address(pre).call(hex"");
    pre.unrelated();
  }
}

contract RevertTest2 {

  uint x;
  uint y;

  function() external {
    x = 2;
    y = x;
    assert(false);
  }

  function run() public {
    x = 1;
    address(this).call.gas(gasleft()/2)(hex"");
    y = x;
  }
}

contract PreExisting {

  uint z;

  event Touch(uint);

  constructor() public {
    z = 100;
  }

  function() external {
    emit Touch(z);
    revert();
  }

  function unrelated() public {
    emit Touch(12);
  }
}

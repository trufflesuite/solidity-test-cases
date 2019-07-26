pragma solidity ^0.5.3;

contract Base {
  function doStuff(uint x) public pure returns (uint) {
    return x;
  }
}

contract Derived is Base {
  function doStuff(uint x) public pure returns (uint) {
    return x + 1;
  }

  function run() public view {
    function (uint) internal pure returns (uint) f;
    function (uint) external pure returns (uint) g;
    //f = doStuff;
    f = super.doStuff;
    f = Base.doStuff;
    f = Derived.doStuff;
    g = this.doStuff;
    //g = this.super.doStuff; //??
    //g = super.this.doStuff; //??
    //g = this.Base.doStuff; //??
    //g = Base.this.doStuff; //??
    //g = this.Derived.doStuff; //??
    //g = Derived.this.doStuff; //??
  }
}

contract BaseEmitter {

  event Name(string);

  function run() public {
    emitName();
  }

  function emitName() public {
    emit Name("BaseEmitter");
  }

  /*
  function extOver() external {
    emit Name("BaseEmitter");
  }
  */
}

contract DerivedEmitter is BaseEmitter {
  function emitName() public {
    emit Name("DerivedEmitter");
  }

  /*
  function extOver() external {
    emit Name("DerivedEmitter");
    super.extOver();
  }
  */
}

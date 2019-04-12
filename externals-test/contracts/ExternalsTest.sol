pragma solidity ^0.5.7;

contract Tester {

  event Done();

  function() external storageFn;

  Base c0;
  Base c1;
  Base c2;

  Abstract a1;
  Abstract a2;

  Interface i1;
  Interface i2;

  constructor() public {
    c0 = new Base();
    c1 = new Derived1();
    c2 = new Derived2();

    a1 = new Concrete1();
    a2 = new Concrete2();

    i1 = new Implementation1();
    i2 = new Implementation2();
  }

  function run() public {
    function() external[1] memory memoryFns;
    function() external stackFn;

    storageFn = c0.doThingC;
    memoryFns[0] = c0.doThingC;
    stackFn = c0.doThingC;

    storageFn = c0.doOtherThingC;
    memoryFns[0] = c0.doOtherThingC;
    stackFn = c0.doOtherThingC;

    storageFn = c1.doThingC;
    memoryFns[0] = c1.doThingC;
    stackFn = c1.doThingC;

    storageFn = c2.doThingC;
    memoryFns[0] = c2.doThingC;
    stackFn = c2.doThingC;

    storageFn = a1.doThingA;
    memoryFns[0] = a1.doThingA;
    stackFn = a1.doThingA;

    storageFn = a2.doThingA;
    memoryFns[0] = a2.doThingA;
    stackFn = a2.doThingA;

    storageFn = i1.doThingI;
    memoryFns[0] = i1.doThingI;
    stackFn = i1.doThingI;

    storageFn = i2.doThingI;
    memoryFns[0] = i2.doThingI;
    stackFn = i2.doThingI;

    storageFn();
    memoryFns[0]();
    stackFn();
  }
}

contract Base {
  function doThingC() public {
    emit Done(0);
  }

  function doOtherThingC() public {
    emit Done(0);
  }

  event Done(uint);
}

contract Derived1 is Base {
  function doThingC() public {
    emit Done(1);
  }
}

contract Derived2 is Base {
  function doThingC() public {
    emit Done(2);
  }
}

contract Abstract {
  function doThingA() public;

  event Done(uint);
}

contract Concrete1 is Abstract {
  function doThingA() public {
    emit Done(1);
  }
}

contract Concrete2 is Abstract {
  function doThingA() public {
    emit Done(2);
  }
}

interface Interface {
  function doThingI() external;

  event Done(uint);
}

contract Implementation1 is Interface {
  function doThingI() external {
    emit Done(1);
  }
}

contract Implementation2 is Interface {
  function doThingI() external {
    emit Done(2);
  }
}

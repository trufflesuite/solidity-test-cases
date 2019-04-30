pragma solidity ^0.5.8;

contract DecodingTestBase {

  event Log(uint);

  function inherited() public {
    emit Log(0);
  }
}

library DecodingTestLib {

  event Done();
  
  function libraryFn() internal {
    emit Done();
  }
}

contract DecodingTest is DecodingTestBase {

  function inherited() public {
    emit Log(1);
  }

  function() internal conStorageFn;
  function() internal storageFn;
  function() internal invalidConStorageFn;

  function run() public {
    function() internal[1] memory memoryFns;
    function() internal stackFn;

    storageFn = run;
    stackFn = run;
    memoryFns[0] = run;

    storageFn = DecodingTest.inherited;
    stackFn = DecodingTest.inherited;
    memoryFns[0] = DecodingTest.inherited;

    storageFn = DecodingTestBase.inherited;
    stackFn = DecodingTestBase.inherited;
    memoryFns[0] = DecodingTestBase.inherited;

    storageFn = DecodingTestLib.libraryFn;
    stackFn = DecodingTestLib.libraryFn;
    memoryFns[0] = DecodingTestLib.libraryFn;

    emit Log(2);
  }

  constructor() public {
    function() internal[1] memory memoryFns;
    function() internal stackFn;
    
    invalidConStorageFn = stackFn;
    
    conStorageFn = run;
    stackFn = run;
    memoryFns[0] = run;

    conStorageFn = DecodingTest.inherited;
    stackFn = DecodingTest.inherited;
    memoryFns[0] = DecodingTest.inherited;

    conStorageFn = DecodingTestBase.inherited;
    stackFn = DecodingTestBase.inherited;
    memoryFns[0] = DecodingTestBase.inherited;

    conStorageFn = DecodingTestLib.libraryFn;
    stackFn = DecodingTestLib.libraryFn;
    memoryFns[0] = DecodingTestLib.libraryFn;

    emit Log(2);
  }

  function runThrough() public {
    DecodingTest.inherited();
    DecodingTestBase.inherited();
    DecodingTestLib.libraryFn();
  }
}

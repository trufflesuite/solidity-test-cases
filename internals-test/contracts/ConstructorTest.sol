pragma solidity ^0.5.7;

//what happens when an internal fn is called from a constructor?
//what happens when an internal fn is *stored* in a constructor?
//what happens when an internal fn is passed by a constructor, or returned to a constructor?
//what happens when an internal fn is stored in *storage* from a constructor?

contract ConstructorTest {

  event Pause();

  function() internal conStoredFn;
  function() internal conStoredFnInvalid;
  function() internal storedFn;
  function() internal storedFnInvalid;

  constructor() public {
    example();
    function() internal it = example;
    it();
    function() internal[1] memory mem = [example];
    mem[0]();
    function() internal returned = justReturn();
    returned();
    function() internal processed = passThrough(example);
    processed();
    conStoredFn = example;
    conStoredFn();
    function() internal invalid;
    conStoredFnInvalid = invalid;
    //invalid();
  }

  function nonConstructor() public {
    example();
    function() internal it = example;
    it();
    function() internal[1] memory mem = [example];
    mem[0]();
    function() internal returned = justReturn();
    returned();
    function() internal processed = passThrough(example);
    processed();
    storedFn = example;
    storedFn();
    function() internal constructed = conStoredFn;
    constructed();
    function() internal invalid;
    storedFnInvalid = invalid;
  }

  function conInvalid() public {
    conStoredFnInvalid();
  }

  function example() public {
    emit Pause();
  }

  function passThrough(function () internal inFn) internal returns (function() internal outFn) {
    inFn();
    outFn = inFn;
    outFn();
  }

  function justReturn() internal returns (function() internal outFn) {
    outFn = example;
    outFn();
  }
}

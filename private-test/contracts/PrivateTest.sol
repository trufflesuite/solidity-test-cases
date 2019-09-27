pragma solidity ^0.5.11;

contract Base {
  uint internal visible;
  uint private hidden;
  uint public impossibleToMiss;

  constructor() public {
    visible = 99;
    hidden = 1;
    impossibleToMiss = 99999;
  }
}

contract Derived is Base {
  uint internal myVisible;
  uint private myHidden;
  uint public myImpossibleToMiss;

  function run() public returns (uint out) {

    uint local = 372;

    myVisible = 102;
    myHidden = 27;
    myImpossibleToMiss = 88888;
    visible = 47;
    impossibleToMiss = 9999999999;
    
    out = local;
  }
}

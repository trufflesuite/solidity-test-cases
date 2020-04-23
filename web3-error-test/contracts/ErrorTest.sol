pragma solidity ^0.6.6;

contract ErrorTest {

  enum Status {
    Suceed,
    Fail,
    NoisyFail,
    Loop,
    SD
  }

  event Done();

  receive() external payable {
  }

  constructor(Status status) public {
    if(status == Status.Fail) {
      revert();
    }
    else if(status == Status.NoisyFail) {
      revert("Noise!");
    }
    else if(status == Status.Loop) {
      while(true) {
      }
    }
    else if(status == Status.SD) {
      selfdestruct(address(this));
    }
  }

  function run(Status status) public {
    if(status == Status.Fail) {
      revert();
    }
    else if(status == Status.NoisyFail) {
      revert("Noise!");
    }
    else if(status == Status.Loop) {
      while(true) {
      }
    }
    else if(status == Status.SD) {
      selfdestruct(address(this));
    }
    emit Done();
  }
}

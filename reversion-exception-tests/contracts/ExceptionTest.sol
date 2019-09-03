pragma solidity ^0.5.11;

contract ExceptionTest {

  enum Outcome {
    Success, Failure, VerboseFailure, SelfDestruct
  }

  constructor(Outcome outcome) public {
    if(outcome == Outcome.Failure) {
      revert();
    }
    else if(outcome == Outcome.VerboseFailure) {
      revert("You didn't say the magic word!");
    }
    else if(outcome == Outcome.SelfDestruct) {
      selfdestruct(address(this));
    }
  }

  function run(Outcome outcome) public returns (bytes32) {
    if(outcome == Outcome.Failure) {
      revert();
    }
    else if(outcome == Outcome.VerboseFailure) {
      revert("You didn't say the magic word!");
    }
    else if(outcome == Outcome.SelfDestruct) {
      selfdestruct(address(this));
    }
    else {
      return 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;
    }
  }

  function() external payable {
    revert("You hit the fallback function, you dummy!");
  }
}

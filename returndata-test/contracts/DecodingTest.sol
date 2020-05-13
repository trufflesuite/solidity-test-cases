pragma solidity ^0.6.7;

contract DecodingTest {

  event Done();

  enum Result {
    Success,
    Failure,
    NoisyFailure,
    SelfDestruct
  }

  constructor(Result todo) public {
    if(todo == Result.Failure) {
      revert();
    }
    if(todo == Result.NoisyFailure) {
      revert("NOISE");
    }
    if(todo == Result.SelfDestruct) {
      selfdestruct(address(this));
    }
  }

  fallback() external payable {
  }

  function unexpectedBoom() public returns (uint) {
    selfdestruct(address(this));
  }

  function expectedBoom() public {
    selfdestruct(address(this));
  }

  function unexpectedFail() public returns (uint) {
    emit Done();
    revert();
  }

  function expectedFail() public {
    emit Done();
    revert();
  }

  function noisyFail() public returns (string memory) {
    emit Done();
    revert("NOISE");
  }

  function success() public {
    emit Done();
  }

  function noisySuccess() public returns (string memory noise, string memory moreNoise) {
    noise = "NOISE";
    moreNoise = "NOISE";
    emit Done();
  }

}

library DecodingTestLibrary {
}

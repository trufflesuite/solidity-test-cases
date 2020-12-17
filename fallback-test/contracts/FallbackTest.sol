//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract FallbackTest {

  event Done();

  fallback(bytes calldata input) external returns (bytes memory output) {
    output = input;
    emit Done();
  }

  /*
  //this is not legal
  receive() external payable returns (bytes memory output) {
    return hex"";
  }
  */

  /*
  function throwOffTheBase() public {
    emit Done();
  }
  */

  function dontThrowOffTheBase() internal {
    emit Done();
  }
}

contract OffBaseTest {

  event Done();

  fallback(bytes calldata input) external returns (bytes memory output) {
    output = input;
    emit Done();
  }

  function throwOffTheBase() public {
    emit Done();
  }

}

contract SigTest {

  event Sig(bytes4);

  fallback(bytes calldata input) external returns (bytes memory output) {
    output = input;
    emit Sig(msg.sig);
  }

}

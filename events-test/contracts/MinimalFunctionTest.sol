pragma solidity ^0.5.9;

contract MinimalFunctionTest {
  event Function(function() external);
  function run() external {
    emit Function(this.run);
  }
}

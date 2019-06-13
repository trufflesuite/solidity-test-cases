pragma solidity 0.4.15;

contract MutabilityTest {

  function() external constant payable returns (uint) weirdVariable;

  function weirdFunction() public constant payable returns (uint) {
    return 1;
  }

  function run() public {
    weirdVariable = this.weirdFunction;
  }
}

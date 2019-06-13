pragma solidity 0.4.15;

contract MutabilityTest {

  /*
  function() external constant payable returns (uint) weirdVariable;

  function weirdFunction() public constant payable returns (uint) {
    return 1;
  }

  function run() public {
    weirdVariable = this.weirdFunction;
  }
  */

 function() external constant notConstant = this.constant1;

 function constant1() external constant {
 }

 function constant2() external constant {
 }

 function changeConstant() public {
   notConstant = this.constant1;
   notConstant = this.constant2;
 }
}

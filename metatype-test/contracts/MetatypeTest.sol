pragma solidity ^0.5.5;

contract MetatypeTest {

  event Done();

  function runSimple() public returns (bytes memory cCode, bytes memory rCode, string memory name) {
    cCode = type(MetatypeLibrarySimple).creationCode;
    rCode = type(MetatypeLibrarySimple).runtimeCode; //does not require linking; has 0s in the delegatecall guard!
    name = type(MetatypeLibrarySimple).name;
    emit Done();
  }

  function runComplex() public returns (bytes memory cCode, bytes memory rCode, string memory name) {
    //cCode = type(MetatypeLibraryComplex).creationCode; //requires linking!
    //rCode = type(MetatypeLibraryComplex).runtimeCode; //requires linking!
    name = type(MetatypeLibraryComplex).name;
    emit Done();
  }
}

library MetatypeLibrarySimple {
}

library MetatypeLibraryComplex {

  event Done();

  function doStuff() external {
    emit Done();
  }

  function makeACall() external {
    MetatypeLibraryComplex.doStuff();
  }
}

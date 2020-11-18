pragma solidity >=0.7.0;

library ReceveivesInternal {
  function receivesInternal(function() internal it) internal {
    it();
  }
  //does not compile w/external or public, because duh
}

pragma solidity ^0.5.8;

contract Fixed0Test {
  fixed notAnInt;
  fixed128x0 basicallyAnInt;

  event TakesAnIntKindOf(fixed, fixed128x0);

  /*
  function run() public {
    emit TakesAnIntKindOf(notAnInt, basicallyAnInt);
  }
  */
}

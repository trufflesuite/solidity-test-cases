pragma solidity ^0.6.7;

contract RevertFormatTest {

  event Error(uint);


  function fail() public {
    revert("AAAAAAAA");
  }

  function fail2(uint x) public returns (uint y) {
    y = x;
    revert("Huh???");
  }

  function fail3() public {
    require(false, "IDK man");
  }

  function fail4() public {
    require(false);
  }

  function fail5() public {
    revert();
  }
}

//WHAT.  There is a 4-byte selector before the
//(ABI-encoded as a 1-tuple) revert message!!
//what does it mean?? it's not the function
//selector!

//what, other than revert() and require(),
//can cause a revert? (hopefully these are
//reverts and not INVALIDs)
//not sure if this is comprehensive, but...
//0. direct use of revert() or require()
//1. uncaught exception from external call
//2. direct call to library function
//3. call w/no matching function, no fallback
//4. ether paid to nonpayable function
//5. ether paid to nonpayable fallback function
//6. ether paid to nonpayable constructor
//7. external call w/a return value self-destructs instead
//8. divide by zero
//9. overlarge cast to enum
//10. maybe: call with bad data?
//10A. overlarge enums
//10B. booleans not zero or one
//10C. forced to read past end of calldata/code??

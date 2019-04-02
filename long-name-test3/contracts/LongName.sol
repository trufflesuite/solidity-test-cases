pragma solidity ^0.5.7;

library ThisLibraryHasAReallyLongNameWayLongerThanTwiceAWordItWillBeAPainToTypeGoodThingTheresCopyAndPaste {
  function getsCalled() external {
  }

  function calls() external {
    ThisLibraryHasAReallyLongNameWayLongerThanTwiceAWordItWillBeAPainToTypeGoodThingTheresCopyAndPaste.getsCalled();
  }
}

library ThisLibraryAlsoHasAReallyLongNameButItDoesntReferToItselfSoMaybeItCanBeDeployed {
  function run() external {
  }
}

//short name tests
library X {
  function getsCalled() external {
  }

  function calls() external {
    X.getsCalled();
  }
}

library _ {
  function getsCalled() external {
  }

  function calls() external {
    _.getsCalled();
  }
}

library $ {
  function getsCalled() external {
  }

  function calls() external {
    $.getsCalled();
  }
}

contract Tester {
  function run() public {
    ThisLibraryHasAReallyLongNameWayLongerThanTwiceAWordItWillBeAPainToTypeGoodThingTheresCopyAndPaste.calls();
  }

  /*
  function runNoSelfRef() public {
    ThisLibraryAlsoHasAReallyLongNameButItDoesntReferToItselfSoMaybeItCanBeDeployed.run();
  }
  */

  /*
  function runShort() public {
    X.calls();
  }
  */
}

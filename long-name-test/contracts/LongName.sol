pragma solidity ^0.5.7;

library ThisLibraryHasAReallyLongNameWayLongerThanTwiceAWordItWillBeAPainToTypeGoodThingTheresCopyAndPaste {
  function getsCalled() external {
  }

  function calls() public {
    ThisLibraryHasAReallyLongNameWayLongerThanTwiceAWordItWillBeAPainToTypeGoodThingTheresCopyAndPaste.getsCalled();
  }
}

//short name tests
library X {
  function getsCalled() external {
  }

  function calls() public {
    X.getsCalled();
  }
}

library _ {
  function getsCalled() external {
  }

  function calls() public {
    _.getsCalled();
  }
}

library $ {
  function getsCalled() external {
  }

  function calls() public {
    $.getsCalled();
  }
}

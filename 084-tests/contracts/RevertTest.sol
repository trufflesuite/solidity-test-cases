//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error Unhelpful(uint);

contract RevertTest {

  event Here();

  error CalledBy(address);
  error g14393(uint8);
  error h9316(bytes32);

  function local() public {
    emit Here();
    revert CalledBy(msg.sender);
  }

  function global() public {
    emit Here();
    revert Unhelpful(block.timestamp);
  }

  function foreign() public {
    emit Here();
    revert Aux.What(-1);
  }

  function foreignEvent() public {
    AuxLib.fail();
  }

  function foreignFail() public {
    AuxLib.foreignFail();
  }

  function failHere() public {
    emit Here();
    revert g14393(0);
  }

  function failThere() public {
    Aux aux = new Aux();
    aux.fail();
  }

  function failAmbig() public {
    emit Here();
    revert h9316(hex"");
  }

  function failAmbigThere() public {
    Aux aux = new Aux();
    aux.failAmbig();
  }
}

contract Aux {
  error What(int);

  error a27129();
  error b27072(uint);

  event Mark();

  function fail() public {
    emit Mark();
    revert a27129();
  }

  function failAmbig() public {
    emit Mark();
    revert b27072(0);
  }
}

library AuxLib {
  event Fail();
  error AuxFail();
  error DefinitelyForeign();

  function fail() internal {
    emit Fail();
    revert AuxFail();
  }

  function foreignFail() external {
    emit Fail();
    revert AuxFail();
  }
}

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NonceTest {

  event Log();

  function doNothing() public {
    emit Log();
  }

  function fail() public {
    emit Log();
    revert();
  }

  function make() public {
    new Spawn(true);
  }

  function dontMake() public {
    try new Spawn(false) {
    } catch (bytes memory) {
    }
  }

  function makeThenFail() public {
    new Spawn(true);
    revert();
  }

  function dontMakeThenFail() public {
    new Spawn(false);
  }

  function indirectMakeThenFail() public {
    try this.makeThenFail() {
    } catch (bytes memory) {
    }
  }

  function indirectDontMakeThenFail() public {
    try this.dontMakeThenFail() {
    } catch (bytes memory) {
    }
  }

  function distantMakeThenFail() public {
    this.make();
    revert();
  }

  function distantDontMakeThenFail() public {
    this.dontMake();
    revert();
  }

}

contract Spawn {
  constructor(bool success) {
    require(success);
  }
}

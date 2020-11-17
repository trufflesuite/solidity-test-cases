//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract GasTest {

  event Dummy();

  uint256[3] words;
  Temporary temp;

  constructor() payable {
  }

  function run() public {
    emit Dummy();
    this.succeed{gas: gasleft() - 900}();
    emit Dummy();
    try this.fail{gas: gasleft() - 900}() {
    emit Dummy();
    } catch (bytes memory) {
    }
    emit Dummy();
    try this.failbad{gas: gasleft() - 900}() {
    } catch (bytes memory) {
    }
    emit Dummy();
  }

  function simple() public {
    this.succeed();
  }

  function succeed() public {
    emit Dummy();
  }
  
  function fail() public {
    emit Dummy();
    revert();
  }

  function failbad() public {
    emit Dummy();
    assert(false);
  }

  function prepare() public {
    bool unready;
    assembly {
      unready := iszero(extcodesize(sload(temp.slot)))
    }
    if (unready) {
      temp = new Temporary{salt: hex""}();
    }
    if (words[0] == 0) {
      words[0] = 1;
      words[1] = 1;
      words[2] = 1;
    }
  }

  function doesthiswork() public {
    try this.justatest{value: 1}() {
    } catch (bytes memory) {
    }
  }

  function justatest() public payable {
  }

  function sdtest() public {
    emit Dummy();
    temp.boom();
    emit Dummy();
  }

  function deletetest() public {
    emit Dummy();
    delete words;
    emit Dummy();
  }

  function rundeletetest() public {
    emit Dummy();
    this.deletetest();
    emit Dummy();
  }

  function payme() public payable {
    emit Dummy();
  }

  function stiptest() public {
    emit Dummy();
    this.payme{value: 1}();
    emit Dummy();
    new Temporary{value: 1}();
    emit Dummy();
  }

  function makeSink() public {
    new Sink();
  }
}

contract Temporary {

  event Dummy();

  function confirm() public {
  }

  constructor() payable {
  }

  function boom() public {
    emit Dummy();
    selfdestruct(tx.origin);
  }
}

contract Sink {
  constructor() payable {
  }
  fallback() external payable {
  }
}

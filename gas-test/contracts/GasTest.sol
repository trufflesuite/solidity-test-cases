//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract GasTest {

  event Dummy();

  function run() public {
    emit Dummy();
    this.succeed();
    emit Dummy();
    try this.fail() {
    emit Dummy();
    } catch(bytes memory) {
    }
    emit Dummy();
    try this.failbad() {
    } catch(bytes memory) {
    }
    emit Dummy();
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
}

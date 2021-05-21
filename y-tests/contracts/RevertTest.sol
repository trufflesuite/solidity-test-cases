//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract RevertTest {

  event Here();

  function run() public {
    emit Here();
    try this.run2() {
    } catch {
    }
    revert();
  }

  function run2() public {
    emit Here();
    this.run3();
  }

  function run3() public {
    emit Here();
    revert();
  }

  function ok() public {
    emit Here();
  }

  function better() public {
    try this.run3() {
    } catch {
    }
    this.ok();
  }
}

//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract CatchTest {

  event SuccessEvent(bytes1);
  event ErrorEvent(string);
  event PanicEvent(uint);
  event RevertEvent(bytes);

  function run() public {
    function() pure external returns (bytes1)[] memory fns = new function() pure external returns (bytes1)[](4);
    fns[0] = this.returner;
    fns[1] = this.errorer;
    fns[2] = this.panicker;
    fns[3] = this.taciturn;
    for (uint i = 0; i < fns.length; i++) {
      try fns[i]() returns (bytes1 b) {
        emit SuccessEvent(b);
      } catch Error(string memory s) {
        emit ErrorEvent(s);
      /*
      } catch Panic(uint p) { //illegal at present!
        emit PanicEvent(p);
      */
      } catch (bytes memory x) {
        emit RevertEvent(x);
      }
    }
  }

  function returner() public pure returns (bytes1) {
    return 0xff;
  }

  function errorer() public pure returns (bytes1) {
    revert("Nope!");
  }

  function panicker() public pure returns (bytes1) {
    assert(false);
  }

  function taciturn() public pure returns (bytes1) {
    revert();
  }
}

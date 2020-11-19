//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract CatchTest {

  event SuccessEvent(byte);
  event ErrorEvent(string);
  event PanicEvent(uint);
  event RevertEvent(bytes);

  function run() public {
    function() pure external returns (byte)[] memory fns = new function() pure external returns (byte)[](4);
    fns[0] = this.returner;
    fns[1] = this.errorer;
    fns[2] = this.panicker;
    fns[3] = this.taciturn;
    for (uint i = 0; i < fns.length; i++) {
      try fns[i]() returns (byte b) {
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

  function returner() public pure returns (byte) {
    return 0xff;
  }

  function errorer() public pure returns (byte) {
    revert("Nope!");
  }

  function panicker() public pure returns (byte) {
    assert(false);
  }

  function taciturn() public pure returns (byte) {
    revert();
  }
}

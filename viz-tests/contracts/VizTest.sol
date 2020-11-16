//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

contract VizTest {

  event Dummy();
  event Word(bytes32);
  event Bool(bool);
  event Result(bool, bytes);
  event Multiple(uint[]);

  mapping(uint => uint) public toget;

  constructor() payable {
  }

  function test(uint) public returns (uint) {
    emit Dummy();
    another(12);
    this.another(97);
    Library.inlined(66);
    Library.outlined(85);
    free(89);
    this.toget(79);
    assembly {
      function what() {
      }
      what()
    }
    try this.revertTest(99) {
    } catch (bytes memory) {
    }
    try this.undefTest() {
    } catch (bytes memory) {
    }
    try this.payTest{value: address(this).balance + 1}() {
    } catch (bytes memory) {
    }
    uint[] memory arr = new uint[](1);
    arr[0] = 12;
    try this.sliceTest(arr) {
    } catch (bytes memory) {
    }
    Temporary temp = new Temporary{salt: hex"deadbeef"}(47);
    address(temp).transfer(1);
    emit Bool(address(temp).send(address(this).balance + 1));
    emit Word(sha256("_"));
    temp.boom(false);
    (new Temporary(38)).boom(true);
    (bool success, bytes memory result) = address(Library).delegatecall(hex"deadbeef");
    emit Result(success, result);
    return 5;
  }

  function another(uint) public returns (uint) {
    emit Dummy();
    another2(55);
    return 8;
  }

  function another2(uint) public returns (uint) {
    emit Dummy();
    return 8;
  }

  function revertTest(uint) public {
    directRevert();
  }

  function directRevert() public {
    emit Dummy();
    revert("foo");
  }

  function payTest() public payable {
  }

  function undefTest() public {
    function() internal f;
    f();
  }

  function sliceTest(uint[] calldata a) public {
    emit Multiple(uint[](a[1 : a.length]));
  }
}

contract Temporary {

  event Dummy();

  uint immutable initial = another(36);

  constructor(uint) {
    another(44);
  }

  function another(uint) public returns (uint) {
    emit Dummy();
    return 77;
  }

  function boom(bool destroy) public {
    directBoom(destroy);
  }

  function directBoom(bool destroy) public {
    selfdestruct(destroy ? address(this) : tx.origin);
  }

  receive() external payable {
    another(initial);
  }
}

library Library {

  event Dummy();

  function inlined(uint) internal returns (uint) {
    emit Dummy();
    return 88;
  }

  function outlined(uint) external returns (uint) {
    emit Dummy();
    inlined(47);
    return 93;
  }
}

function free(uint) returns (uint) {
  new Temporary(33);
}

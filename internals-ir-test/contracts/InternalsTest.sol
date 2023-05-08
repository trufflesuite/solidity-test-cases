//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

function free() pure {
  revert("florb");
}

function unused() pure {
  revert("garmb");
}

function free2() pure {
  revert("wherble");
}

library Lib {
  event LibEv();
  event UhOh();
  function lib() internal {
    emit LibEv();
  }
  function libunused() internal {
    emit UhOh();
  }
}

contract InternalsTestBase {

  int8 barrier1;
  function() internal pointer;
  int8 barrier2;
  int bigBarrier;

  event Done();
  event Fn(uint);
  event UhOh();

  function one() public {
    emit Fn(1);
  }
  function two() internal {
    emit Fn(2);
  }
  function priv() private {
    emit UhOh();
  }
  function extbase() external {
    emit UhOh();
  }

  function run() public virtual {
    barrier1 = -1;
    barrier2 = -1;
    bigBarrier = -1;
    pointer = one;
    pointer = two;
    pointer = priv;
    pointer = free;
    pointer = free2;
    pointer = Lib.lib;
    emit Done();
  }
}

contract InternalsTest is InternalsTestBase {

  function three() public {
    emit Fn(3);
  }

  function four() internal {
    emit Fn(4);
  }

  function five() private {
    emit Fn(5);
  }

  function ext() external {
    emit UhOh();
    free();
  }

  function run() public override {
    barrier1 = -1;
    barrier2 = -1;
    bigBarrier = -1;
    pointer = one;
    pointer = two;
    pointer = three;
    pointer = four;
    pointer = five;
    pointer = free;
    pointer = free2;
    pointer = Lib.lib;
    emit Done();
  }
}

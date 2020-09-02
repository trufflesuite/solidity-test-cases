//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract Tester {

  event Done();

  ThisTest nonself;

  address[1] receiver;

  address sender;

  uint[2] buffer;

  function run() public {
    nonself = new ThisTest();
  }

  function runLib() public {
    ThisTestLib.store(receiver);
    emit Done();
  }

  function testTrace() public {
    uint sum;
    buffer[0] = 33;
    buffer[1] = 35;
    sum = ThisTestLib.add(buffer);
    emit Done();
  }

  function testSender() public {
    new SenderTest(this);
  }

  function recordSender() public {
    sender = msg.sender;
    emit Done();
  }

  function testSenderLib() public {
    ThisTestLib.testSender(this);
  }
}

contract ThisTest {

  event Done();

  ThisTest public self;

  constructor() {
    self = this;
    emit Done();
  }

}

contract SenderTest {

  SenderTest self;

  constructor(Tester invoker) {
    self = this;
    invoker.recordSender();
  }
}

library ThisTestLib {
  function store(address[1] storage receiver) external {
    receiver[0] = address(this);
  }

  function add(uint[2] storage summands) external view returns (uint) {
    return summands[0] + summands[1];
  }

  function testSender(Tester invoker) public {
    invoker.recordSender();
  }
}

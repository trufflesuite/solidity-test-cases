pragma solidity ^0.5.0;

contract Tester {

  event Done();

  ThisTest nonself;

  address[1] receiver;

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
}

contract ThisTest {

  event Done();

  ThisTest public self;

  constructor() public {
    self = this;
    emit Done();
  }

}

library ThisTestLib {
  function store(address[1] storage receiver) external {
    receiver[0] = address(this);
  }

  function add(uint[2] storage summands) external returns (uint) {
    return summands[0] + summands[1];
  }
}

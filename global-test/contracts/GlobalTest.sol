pragma solidity ^0.5.6;

contract GlobalTest {

  event Done(uint x);

  struct Msg {
    bytes data;
    address payable sender;
    bytes4 sig;
    uint value;
  }

  struct Tx {
    address payable origin;
    uint gasprice;
  }

  struct Block {
    address payable coinbase;
    uint difficulty;
    uint gaslimit;
    uint number;
    uint timestamp;
  }

  Msg _msg;
  Tx _tx;
  Block _block;
  GlobalTest _this;
  uint _now;

  function run(uint x) public payable {
    _this = this;
    _now = now;
    _msg = Msg(msg.data, msg.sender, msg.sig, msg.value);
    _tx = Tx(tx.origin, tx.gasprice);
    _block = Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp);
    emit Done(x);
  }

  function runRun(uint x) public payable {
    this.run.value(msg.value / 2)(x);
  }

  function() external payable {
    _this = this;
    _now = now;
    _msg = Msg(msg.data, msg.sender, msg.sig, msg.value);
    _tx = Tx(tx.origin, tx.gasprice);
    _block = Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp);
    emit Done(0);
  }

  function runFallback() public payable {
    (bool status, bytes memory result) =
      address(this).call.value(msg.value / 2)(hex"face");
    emit Done(status ? result.length : 0);
  }

  function staticTest(uint x) public view returns (uint) {
    Msg memory __msg;
    Tx memory __tx;
    Block memory __block;
    GlobalTest __this;
    uint __now;
    __this = this;
    __now = now;
    __msg = Msg(msg.data, msg.sender, msg.sig, 0);
    __tx = Tx(tx.origin, tx.gasprice);
    __block = Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp);
    return x + uint(address(__this)) + __now
      + __msg.value + __tx.gasprice + __block.number;
  }

  function runStatic(uint x) public {
    emit Done(this.staticTest(x));
  }

  function runLib(uint x) public payable {
    GlobalTestLib.run(x);
  }

  function runCreate(uint x) public payable {
    (new CreationTest).value(msg.value / 2)(x);
  }
}

contract CreationTest {
  GlobalTest.Msg _msg;
  GlobalTest.Tx _tx;
  GlobalTest.Block _block;
  CreationTest _this;
  uint _now;

  event Done(uint x);

  constructor(uint x) public payable {
    _this = this;
    _now = now;
    _msg = GlobalTest.Msg(msg.data, msg.sender, msg.sig, msg.value);
    _tx = GlobalTest.Tx(tx.origin, tx.gasprice);
    _block = GlobalTest.Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp);
    emit Done(x);
  }
}

library GlobalTestLib {

  event Done(uint x);

  function run(uint x) external {
    GlobalTest.Msg memory __msg;
    GlobalTest.Tx memory __tx;
    GlobalTest.Block memory __block;
    GlobalTestLib __this;
    uint __now;
    __this = this;
    __now = now;
    __msg = GlobalTest.Msg(msg.data, msg.sender, msg.sig, msg.value);
    __tx = GlobalTest.Tx(tx.origin, tx.gasprice);
    __block = GlobalTest.Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp);
    emit Done(x + uint(address(__this)) + __now
      + __msg.value + __tx.gasprice + __block.number);
  }
}

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalTest {

  event Done(uint x);
  event Finished(GlobalTest);

  struct Msg {
    bytes data;
    address sender;
    bytes4 sig;
    uint value;
  }

  struct Tx {
    address origin;
    uint gasprice;
  }

  struct Block {
    address payable coinbase;
    uint difficulty;
    uint gaslimit;
    uint number;
    uint timestamp;
    uint chainid;
  }

  Msg _msg;
  Tx _tx;
  Block _block;
  GlobalTest public _this;

  function run(uint x) public payable {
    _this = this;
    _msg = Msg(msg.data, msg.sender, msg.sig, msg.value);
    _tx = Tx(tx.origin, tx.gasprice);
    _block = Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp, block.chainid);
    emit Done(x);
  }

  function runRun(uint x) public payable {
    this.run{value: msg.value / 2}(x);
  }

  fallback() external payable {
    _this = this;
    _msg = Msg(msg.data, msg.sender, msg.sig, msg.value);
    _tx = Tx(tx.origin, tx.gasprice);
    _block = Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp, block.chainid);
    emit Done(0);
  }

  receive() external payable {
    _this = this;
    _msg = Msg(hex"", msg.sender, msg.sig, msg.value);
    _tx = Tx(tx.origin, tx.gasprice);
    _block = Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp, block.chainid);
    emit Done(0);
  }

  function runFallback() public payable {
    (bool status, bytes memory result) =
      address(this).call{value: msg.value / 2}(hex"face");
    emit Done(status ? result.length : 0);
  }

  function runReceive() public payable {
    (bool status, bytes memory result) =
      address(this).call{value: msg.value / 2}(hex"");
    emit Done(status ? result.length : 0);
  }

  function staticTest(uint x) public view returns (uint) {
    Msg memory __msg;
    Tx memory __tx;
    Block memory __block;
    GlobalTest __this;
    __this = this;
    __msg = Msg(msg.data, msg.sender, msg.sig, 0);
    __tx = Tx(tx.origin, tx.gasprice);
    __block = Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp, block.chainid);
    return x + uint160(address(__this))
      + __msg.value + __tx.gasprice + __block.number;
  }

  function runStatic(uint x) public {
    emit Done(this.staticTest(x));
  }

  function runLib(uint x) public payable {
    GlobalTestLib.run(x);
  }

  function runCreate(uint x) public payable {
    new CreationTest{value: msg.value / 2}(x, true);
  }

  function runGetter() public {
    emit Finished(this._this());
  }

  function runFailedCreate2(uint x) public payable {
    try new CreationTest{
      value: msg.value / 2,
      salt: 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
    }(x, false) {
    } catch (bytes memory) {
    }
  }
}

contract CreationTest {
  GlobalTest.Msg _msg;
  GlobalTest.Tx _tx;
  GlobalTest.Block _block;
  CreationTest _this;

  event Done(uint x);

  constructor(uint x, bool succeed) payable {
    _this = this;
    _msg = GlobalTest.Msg(msg.data, msg.sender, msg.sig, msg.value);
    _tx = GlobalTest.Tx(tx.origin, tx.gasprice);
    _block = GlobalTest.Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp, block.chainid);
    require(succeed);
    emit Done(x);
  }
}

library GlobalTestLib {

  event Done(uint x);

  function run(uint x) external {
    GlobalTest.Msg memory __msg;
    GlobalTest.Tx memory __tx;
    GlobalTest.Block memory __block;
    __msg = GlobalTest.Msg(msg.data, msg.sender, msg.sig, msg.value);
    __tx = GlobalTest.Tx(tx.origin, tx.gasprice);
    __block = GlobalTest.Block(block.coinbase, block.difficulty,
      block.gaslimit, block.number, block.timestamp, block.chainid);
    emit Done(x + __msg.value + __tx.gasprice + __block.number);
  }
}

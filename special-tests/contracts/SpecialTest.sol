pragma solidity ^0.5.3;

contract SpecialTest
{

  //specialTest

  event Done();

  /*
  function specialTest() internal returns (
    function (uint) internal view returns (bytes32) blockhashFn,
    function () internal view returns (uint) gasleftFn,
    function (bool) internal pure assertFn,
    function (bool) internal requireFn1,
    function (bool, string memory) internal requireFn2,
    function () internal revertFn1,
    function (string memory) internal revertFn2,
    function (uint, uint, uint) internal pure returns (uint) addmodFn,
    function (uint, uint, uint) internal pure returns (uint) mulmodFn,
    function (bytes memory) internal pure returns (bytes32) keccak256Fn,
    function (bytes memory) internal pure returns (bytes32) sha256Fn,
    function (bytes memory) internal pure returns (bytes20) ripemd160Fn,
    function (bytes32, uint8, bytes32, bytes32) internal pure returns (address) ecrecoverFn,
    function (address payable) internal selfdestructFn
  )
  {
    blockhashFn = blockhash;
    gasleftFn = gasleft;
    assertFn = assert;
    requireFn1 = require;
    requireFn2 = require;
    revertFn1 = revert;
    revertFn2 = revert;
    addmodFn = addmod;
    mulmodFn = mulmod;
    keccak256Fn = keccak256;
    sha256Fn = sha256;
    ripemd160Fn = ripemd160;
    ecrecoverFn = ecrecover;
    selfdestructFn = selfdestruct;
  }

  function specialTester() public
  {
    specialTest();
  }
  */

  //memberTest
  //push -- need to specify a specialization (takes <type>, returns uint)
  //pop -- always the same! (doesn't return anything)
  //note these exist for bytes as well as for <type>[]
  //I already tried gas() and value(), but what about gas and value? :)

  /*
  function memberTest() internal returns (
    function (uint) internal transferFn, //address payable
    function (uint) internal returns (bool) sendFn, //address payable
    function (bytes memory) internal returns (bool, bytes memory) callFn, //address
    function (bytes memory) internal returns (bool, bytes memory) delegatecallFn, //address
    function (bytes memory) internal view returns (bool, bytes memory) staticcallFn //address
  )
  {
    transferFn = address(this).transfer;
    sendFn = address(this).send;
    callFn = address(this).call;
    delegatecallFn = address(this).delegatecall;
    staticcallFn = address(this).staticcall;
  }

  function memberTester() public
  {
    memberTest();
  }

  function() external payable
  {
  }
  */

  /*
  function memberTest2() internal returns (
    function (bytes memory) internal returns (bool, bytes memory) callFn //address
  )
  {
    callFn = address(this).call;
  }

  function memberTester2() public
  {
    memberTest2();
  }
  */

  /*
  int[] arr;

  function arrayMemberTest() internal returns (
    function (int) internal returns (uint) pushFn,
    function () internal popFn
  )
  {
    pushFn = arr.push;
    popFn = arr.pop;
  }

  function arrayMemberTester() public
  {
    arrayMemberTest();
  }
  */

  /*
  function pay() external payable
  {
  }

  function payableMemberTest() internal returns (
    function (uint) internal returns (function() external payable) gasFn,
    function (uint) internal returns (function() external payable) valueFn
  )
  {
    gasFn = this.pay.gas;
    valueFn = this.pay.value;
  }

  function payableMemberTester() public
  {
    payableMemberTest();
  }
  */

  //abiTest

  //abi.decode -- NOT valid solidity type, special syntax
  //abi.encode -- specializations can maybe work
  //abi.encodePacked -- ditto
  //abi.encodeWithSelector -- ditto
  //abi.encodeWithSignature -- ditto

  //AHAHAHA it leaves out the "..." from the official type signature!

  //OK, these won't work, due to the overload problem.
  //or so I thought! they're not implemented that way!

  /*
  function abiTest() internal returns (
    function () internal pure decodeFn,
    function () internal pure returns (bytes memory) encodeFn,
    function () internal pure returns (bytes memory) encodePackedFn,
    function (bytes4) internal pure returns (bytes memory) encodeWithSelectorFn,
    function (string memory) internal pure returns (bytes memory) encodeWithSignatureFn
  )
  {
    decodeFn = abi.decode;
    encodeFn = abi.encode;
    encodePackedFn = abi.encodePacked;
    encodeWithSelectorFn = abi.encodeWithSelector;
    encodeWithSignatureFn = abi.encodeWithSignature;
  }

  function abiTester() public
  {
    abiTest();
  }
  */

  /*
  function extremelySillyTest()
  {
    uint blockVar;
    uint msgVar;
    uint txVar;
    uint abiVar;
    blockVar = block;
    msgVar = msg;
    txVar = tx;
    abiVar = abi;
  }
  */

  /*
  function logTest() internal returns (
    function (bytes32) internal log0Fn,
    function (bytes32,bytes32) internal log1Fn,
    function (bytes32,bytes32,bytes32) internal log2Fn,
    function (bytes32,bytes32,bytes32,bytes32) internal log3Fn,
    function (bytes32,bytes32,bytes32,bytes32,bytes32) internal log4Fn
  )
  {
    log0Fn = log0;
    log1Fn = log1;
    log2Fn = log2;
    log3Fn = log3;
    log4Fn = log4;
  }

  function logTester() public
  {
    logTest();
  }
  */

  function nodeTypeTest() public view
  {
    bytes4 sig = msg.sig;
    address payable origin = tx.origin;
    uint number = block.number;
    bytes memory one = abi.encode(1);
  }

  function abiNodeTest() public
  {
    uint thirteen;
    uint fourteen;
    uint fifteen;
    bool status;
    bytes memory returndata;
    bytes memory encoded = abi.encode(1,2,3);
    bytes memory packed = abi.encodePacked(uint(4),uint(5),uint(6));
    bytes memory wSelector = abi.encodeWithSelector(0xffffffff, 7, 8, 9);
    bytes memory wSig = abi.encodeWithSignature("hello()", 10, 11, 12);
    (thirteen, fourteen, fifteen) = abi.decode(hex"000000000000000000000000000000000000000000000000000000000000000d000000000000000000000000000000000000000000000000000000000000000e000000000000000000000000000000000000000000000000000000000000000f", (uint, uint, uint));
    uint comparison = mulmod(16, 17, 18);
    (status, returndata) = address(this).call(hex"");
    bytes memory code = type(EmptyTest).creationCode;
  }
}

contract SpecialTest2
{

  struct Pair {
    int x;
    int y;
  }


  function() external payable {
  }

  int[] array;

  function magicTestExtended(bytes calldata dataVs) external payable
  {
    function () internal pure decodeVs;
    function () internal pure returns (bytes memory) encodeVs;
    function (bytes4) internal pure returns (bytes memory) encodeWithSelectorVs;
    function (string memory) internal pure returns (bytes memory) encodeWithSignatureVs;
    address payable addressPayableVs;
    uint uintVs;
    bytes4 sigVs;
    block;
    block.coinbase;
    block.difficulty;
    block.gaslimit;
    block.number;
    block.timestamp;
    msg;
    msg.data;
    msg.sender;
    msg.sig;
    msg.value;
    now;
    tx;
    tx.gasprice;
    tx.origin;
    abi;
    abi.decode(hex"0000000000000000000000000000000000000000000000000000000000000001",(uint));
    abi.encode(1);
    abi.encodePacked(uint(1));
    abi.encodeWithSelector(0xffffffff, 1);
    abi.encodeWithSignature("a()", 1);
  }

  function builtInTestExtended() public
  {
    function (uint) internal view returns (bytes32) blockhashVs;
    function () internal view returns (uint) gasleftVs;
    function (bool) internal pure assertVs;
    function (bool) internal requireVs1;
    function (bool, string memory) internal requireVs2;
    function () internal revert1Vs;
    function (string memory) internal revertVs2;
    function (uint, uint, uint) internal pure returns (uint) opsmodVs;
    function (bytes memory) internal pure returns (bytes32) hash256Vs;
    function (bytes memory) internal pure returns (bytes20) ripemd160Vs;
    function (bytes32, uint8, bytes32, bytes32) internal pure returns (address) ecrecoverVs;
    function (address payable) internal selfdestructVs;
    function (bytes32) internal log0Vs;
    function (bytes32,bytes32) internal log1Vs;
    function (bytes32,bytes32,bytes32) internal log2Vs;
    function (bytes32,bytes32,bytes32,bytes32) internal log3Vs;
    function (bytes32,bytes32,bytes32,bytes32,bytes32) internal log4Vs;
    SpecialTest2 contractVs;
    this;
    blockhash;
    gasleft;
    assert;
    require(true);
    require(true, "");
    revert();
    revert("");
    addmod;
    mulmod;
    keccak256;
    sha256;
    ripemd160;
    ecrecover;
    selfdestruct;
    log0;
    log1;
    log2;
    log3;
    log4;
  }

  function memberTestExtended() public payable
  {
    function (uint) internal transferVs;
    function (uint) internal returns (bool) sendVs;
    function (bytes memory) internal returns (bool, bytes memory) callVs;
    function (bytes memory) internal view returns (bool, bytes memory) staticcallVs;
    function (int) internal returns (uint) pushVs;
    function () internal popVs;
    function (uint) internal returns (function() external payable) gasVs;
    uint uintVs;
    bytes memory bytesVs;
    address(this).balance;
    address(this).transfer(0);
    address(this).send(0);
    address(this).call;
    address(this).delegatecall;
    address(this).staticcall;
    type(EmptyTest).creationCode;
    type(EmptyTest).runtimeCode;
    array.length;
    array.push;
    array.pop;
    this.memberTestExtended.gas;
    this.memberTestExtended.value;
  }

  function resultingTestExtended() public payable
  {
    function (address) internal pure typeVs;
    function () external withStuffVs;
    type;
    this.resultingTestExtended.gas(0);
    this.resultingTestExtended.value(0);
    this.resultingTestExtended.gas(0).value(0);
    address(this).call.gas(0);
    address(this).call.value(0);
    address(this).call.value(0).gas(0);
  }

  function structorTest() public {
    //function (int,int) internal pure returns (Pair memory) f;
    //function (int,int) external pure returns (Pair memory) fe;
    //function () internal returns (EmptyStructorTest) g;
    //function (uint) internal pure returns (int[] memory) h;
    Pair;
    Pair(3,4);
    Pair({y: 5, x: 7});
    //{y: 5, x: 7};
    //this.Pair;
    //this.Pair(3,4);
    //this.Pair({x: 5, y: 7});
    //f = Pair;
    //fe = this.Pair;
    new EmptyStructorTest();
    new EmptyStructorTest;
    //g = new EmptyStructorTest;
    new int[](2);
    new int[];
    //h = new int[];
  }
}

contract EmptyTest {
}

contract EmptyStructorTest {
  constructor() public {
  }
}

contract UsingTest {
  using UsingTestLib for uint;
  using UsingStarTestLib for *;

  function usingTest() public
  {
    function (uint) internal pure returns (uint) f;
    function (uint,uint) internal pure returns (uint) f2;
    function (uint) internal pure returns (uint) g;
    function (uint,uint) internal pure returns (uint) g2;
    uint a;
    uint b;
    uint c;
    a = 10;
    //f = a.add; //none of these compile
    //g = a.mul;
    //f2 = a.add;
    //g2 = a.mul;
    f2 = UsingTestLib.add;
    g2 = UsingStarTestLib.mul;
    b = a.add(21);
    c = a.mul(3);
    b = UsingTestLib.add(10, 21);
    c = UsingStarTestLib.mul(10, 3);
  }

  function libVarTest() public pure
  {
    function (uint,uint) external pure returns (uint) f;
    UsingTestLib lib;
    address addr;
    //lib = UsingTestLib;
    //addr = address(UsingTestLib);
    lib = UsingTestLib(0x0000000000000000000000000000000000000001); //WHAT
    //f = lib.addPublic; //huh. this fails, but for an unexpected reason.
  }
}

library UsingTestLib {
  function add(uint a, uint b) internal pure returns (uint) {
    return a + b;
  }
  function addPublic(uint a, uint b) public pure returns (uint) {
    return a + b;
  }
  function priv() private pure {
  }
  function libraryVarTest() public {
    function () internal pure f;
    function (uint, uint) internal pure returns (uint) gi;
    //function (uint, uint) external pure returns (uint) ge;
    f = priv;
    gi = addPublic;
    //ge = UsingTestLib.addPublic;
    //ge = this.addPublic;
    //this.addPublic(3,5);
  }
}

library UsingStarTestLib {
  function mul(uint a, uint b) internal pure returns (uint) {
    return a * b;
  }
}

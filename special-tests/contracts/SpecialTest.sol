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

contract EmptyTest {
}

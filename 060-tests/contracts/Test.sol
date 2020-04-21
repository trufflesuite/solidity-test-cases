pragma solidity >0.5.14;

struct Pair {
  uint x;
  uint y;
}

struct StorageOnly {
  mapping(uint => uint) eatThis;
  uint z;
}

enum Ternary {
  Yes, No, MaybeSo
}

abstract contract AbstractTest {
  uint someState;
  function doNothing() public virtual;
}

contract ReceiveTest1 {

  event Data(bytes);
  event Sender(address payable);

  fallback() external {
    emit Data(msg.data);
  }

  receive() external payable {
    emit Sender(msg.sender);
  }
}

contract ReceiveTest2 {

  event Data(bytes);
  event Sender(address payable);

  fallback() external payable {
    emit Data(msg.data);
  }

  receive() external payable {
    emit Sender(msg.sender);
  }
}

/*
contract MapTest {
  mapping(address payable => string) payableMap; //still not allowed
}
*/

contract DataTest {
  Pair pair;
  Ternary ternary;

  struct Comparison {
    int z;
    int w;
  }

  Comparison comparison;

  AbstractTest abstractTest;

  event Bytes(bytes);
  event String(string);
  event Array(uint[]);

  mapping(bytes => bytes) byteMap;
  mapping(string => string) stringMap;
  mapping(address => address) addressMap;

  function slice(bytes calldata b, string calldata s, uint[] calldata a) external {
    emit Bytes(bytes(b[0:2]));
    emit String(string(s[0:2]));
    emit Array(uint[](a[0:2]));

    byteMap[bytes(b[0:2])] = bytes(b[0:2]);
    stringMap[string(s[0:2])] = string(s[0:2]);

    addressMap[payable(address(this))] = address(this);
  }

  function runSlice() public {
    this.slice(hex"deadbeef", "hello", new uint[](3) /*, [5, 6, 7]*/);
  }

  function ohNo() public pure returns (uint) {
    StorageOnly memory illegalStruct;
    return illegalStruct.z;
  }
}

contract CatchTest {

  event Success(uint);
  event Revert(string);
  event RawRevert(bytes);

  function catchTest(function() external returns (uint) fn) internal {
    try fn() returns (uint returnValue) {
      emit Success(returnValue);
    }
    catch Error(string memory message) {
      emit Revert(message);
    }
    catch (bytes memory data) {
      emit RawRevert(data);
    }
  }

  function run() public {
    catchTest(this.good);
    catchTest(this.bad);
    catchTest(this.veryBad);
  }

  function good() public pure returns (uint) {
    return 1;
  }

  function bad() public pure returns (uint) {
    revert("Nope!");
  }
  
  function veryBad() public pure returns (uint) {
    revert();
  }
}

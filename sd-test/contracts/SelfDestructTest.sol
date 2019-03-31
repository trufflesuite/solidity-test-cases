pragma solidity ^0.5.7;
pragma experimental ABIEncoderV2;

contract Tester {

  event Done(uint);

  function run() public {
    uint num; //direct
    uint[2] memory numpair; //multivalue (static)
    uint[] memory numlist; //lookup
    bytes memory bytestring; //lookup (packed)
    bytes[2] memory bytespair; //multivalue (dynamic)
    uint num2; //direct (in dynamic context)
    bytes memory bytestring2; //for use with num2

    SelfDestructTest sd = new SelfDestructTest();

    num = sd.boomNum();
    numpair = sd.boomPair();
    numlist = sd.boomList();
    bytestring = sd.boomBytes();
    bytespair = sd.boomBytesPair();
    (num2, bytestring2) = sd.boomMixed();

    emit Done(num + numpair[0] + numlist.length + bytestring.length
      + bytespair[0].length + num2 + bytestring2.length);
  }

  function simple() public {
    SelfDestructTest sd = new SelfDestructTest();
    sd.boom();
    emit Done(0);
  }
}

contract SelfDestructTest {

  function() external payable {
  }

  function boom() public {
    selfdestruct(address(this));
  }

  function boomNum() public returns (uint) {
    selfdestruct(address(this));
  }

  function boomPair() public returns (uint[2] memory) {
    selfdestruct(address(this));
  }

  function boomList() public returns (uint[] memory) {
    selfdestruct(address(this));
  }

  function boomBytes() public returns (bytes memory) {
    selfdestruct(address(this));
  }

  function boomBytesPair() public returns (bytes[2] memory) {
    selfdestruct(address(this));
  }

  function boomMixed() public returns (uint, bytes memory) {
    selfdestruct(address(this));
  }
}

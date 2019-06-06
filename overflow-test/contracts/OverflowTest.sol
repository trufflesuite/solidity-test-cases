pragma solidity ^0.5.9;

contract OverflowTest {
  uint8 storageByte;

  event BytesEvent(uint8, uint8, uint8, uint8, uint8);
  event ByteEvent(uint8);
  event ActualBytesEvent(byte, byte, byte, byte);

  function run() public {
    uint8[1] memory memoryByte;
    uint8 addend1 = 255;
    uint8 addend2 = 255;
    uint8 sum = addend1 + addend2;
    memoryByte[0] = sum;
    uint8 fromMemory = memoryByte[0];
    storageByte = sum;
    uint8 fromStorage = storageByte;
    uint8 fromReturnData = this.called([sum]);
    uint8 ohno = sum / 2;
    emit BytesEvent(sum, fromMemory, fromStorage, fromReturnData, ohno);
  }

  function called(uint8[1] calldata calldataByte) external returns (uint8 returned) {
    uint8 fromCalldata = calldataByte[0];
    emit ByteEvent(fromCalldata);
    uint8 addend1 = 255;
    uint8 addend2 = 255;
    returned = addend1 + addend2;
  }

  function arithmeticsTest() public {
    byte full = 0xff;
    byte addend = 0x01;
    byte left = full << 1;
    byte right = full >> 1;
    byte mix = full ^ addend;
    byte ohno = right << 1;
    emit ActualBytesEvent(left, right, mix, ohno);
  }
}

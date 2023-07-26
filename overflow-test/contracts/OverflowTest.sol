//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OverflowTest {
  uint8 storageByte;

  event BytesEvent(uint8 indexed, uint8, uint8, uint8, uint8 indexed);
  event ByteEvent(uint8);
  event SignedEvent(int8);
  event ActualBytesEvent(bytes1, bytes1, bytes1, bytes1);

  mapping(uint8 => uint8) byteMap;

  function run() public {
    unchecked {
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
  }

  function called(uint8[1] calldata calldataByte) external returns (uint8 returned) {
    unchecked {
      uint8 fromCalldata = calldataByte[0];
      emit ByteEvent(fromCalldata);
      uint8 addend1 = 255;
      uint8 addend2 = 255;
      returned = addend1 + addend2;
    }
  }

  function arithmeticsTest() public {
    unchecked {
      bytes1 full = 0xff;
      bytes1 addend = 0x01;
      bytes1 left = full << 1;
      bytes1 right = full >> 1;
      bytes1 mix = full ^ addend;
      bytes1 ohno = right << 1;
      emit ActualBytesEvent(left, right, mix, ohno);
    }
  }

  function signedTest() public {
    unchecked {
      int8 byte1 = -128;
      int8 byte2 = -128;
      int8 sum = byte1 + byte2;
      int8 ohno = sum / 2;
      emit SignedEvent(ohno);
    }
  }

  function mappingTest() public {
    unchecked {
      uint8 byte1 = 255;
      uint8 byte2 = 255;
      uint8 sum = byte1 + byte2;
      byteMap[sum] = 1;
    }
  }
}

pragma solidity ^0.5.10;

contract ErrorError {

  /* the control group */

  function valid() public {
    revert('!!!');
  }

  function noReason() public {
    revert();
  }

  function emptyReason() public {
    revert('');
  }

  function utf8() public {
    revert(string(hex'c2a1c2a1c2a1'));
  }

  /* the experimental group */

  function badUtf8() public {
    bytes memory invalid = hex'a1a1a1';
    revert(string(invalid));
  }

  function skipWord() public {
    assembly {
      mstore(0x080, 0x0000000000000000000000000000000000000000000000000000000008c379a0)
      mstore(0x0A0, 0x0000000000000000000000000000000000000000000000000000000000000040)
    //mstore(0x0C0, 0x0000000000000000000000000000000000000000000000000000000000000000)
      mstore(0x0E0, 0x0000000000000000000000000000000000000000000000000000000000000003)
      mstore(0x100, 0x2121210000000000000000000000000000000000000000000000000000000000)
      revert(0x9C, 0x84)
    }
  }

  function misaligned() public {
    assembly {
      mstore(0x80, 0x0000000000000000000000000000000000000000000000000000000008c379a0)
      mstore(0xA0, 0x0000000000000000000000000000000000000000000000000000000000000021)
    //mstore(0xC0, 0x0000000000000000000000000000000000000000000000000000000000000000)
      mstore(0xE0, 0x0321212100000000000000000000000000000000000000000000000000000000)
      revert(0x9C, 0x65)
    }
  }

  function unpadded() public {
    assembly {
      mstore(0x80, 0x0000000000000000000000000000000000000000000000000000000008c379a0)
      mstore(0xA0, 0x0000000000000000000000000000000000000000000000000000000000000020)
      mstore(0xC0, 0x0000000000000000000000000000000000000000000000000000000000000003)
      mstore(0xE0, 0x2121210000000000000000000000000000000000000000000000000000000000)
      revert(0x9C, 0x47)
    }
  }

  function badPadding() public {
    assembly {
      mstore(0x80, 0x0000000000000000000000000000000000000000000000000000000008c379a0)
      mstore(0xA0, 0x0000000000000000000000000000000000000000000000000000000000000020)
      mstore(0xC0, 0x0000000000000000000000000000000000000000000000000000000000000003)
      mstore(0xE0, 0x2121210000000000000000000000000000000000000000000000000000000021)
      revert(0x9C, 0x64)
    }
  }

  function overlong() public {
    assembly {
      mstore(0x80, 0x0000000000000000000000000000000000000000000000000000000008c379a0)
      mstore(0xA0, 0x0000000000000000000000000000000000000000000000000000000000000020)
      mstore(0xC0, 0x0000000000000000000000000000000000000000000000000000000000000021) //length, not '!'
      mstore(0xE0, 0x2121212121212121212121212121212121212121212121212121212121212121)
      revert(0x9C, 0x64)
    }
  }

  function pointPastEnd() public {
    assembly {
      mstore(0x80, 0x0000000000000000000000000000000000000000000000000000000008c379a0)
      mstore(0xA0, 0x0000000000000000000000000000000000000000000000000000000000000020)
      revert(0x9C, 0x24)
    }
  }

  function pointer0() public {
    assembly {
      mstore(0x80, 0x0000000000000000000000000000000000000000000000000000000008c379a0)
    //mstore(0xA0, 0x0000000000000000000000000000000000000000000000000000000000000000)
      revert(0x9C, 0x24)
    }
  }

  function pointer1() public {
    assembly {
      mstore(0x080, 0x0000000000000000000000000000000000000000000000000000000008c379a0)
      mstore(0x0A0, 0x0000000000000000000000000000000000000000000000000000000000000001)
      mstore(0x0C0, 0x0021212121212121212121212121212121212121212121212121212121212121)
      mstore(0x0E0, 0x2121212121212121212121212121212121212121212121212121212121212121)
      mstore(0x100, 0x2121212121212121212121212121212121212121212121212121212121212121)
      mstore(0x120, 0x2121212121212121212121212121212121212121212121212121212121212121)
      mstore(0x140, 0x2121212121212121212121212121212121212121212121212121212121212121)
      mstore(0x160, 0x2121212121212121212121212121212121212121212121212121212121212121)
      mstore(0x180, 0x2121212121212121212121212121212121212121212121212121212121212121)
      mstore(0x1A0, 0x2121212121212121212121212121212121212121212121212121212121212121)
      mstore(0x1C0, 0x2100000000000000000000000000000000000000000000000000000000000000)
      revert(0x9C, 0x125)
    }
  }

  function badSelector() public {
    assembly {
      mstore(0x80, 0x00000000000000000000000000000000000000000000000000000000deadbeef)
      mstore(0xA0, 0x0000000000000000000000000000000000000000000000000000000000000020)
      mstore(0xC0, 0x0000000000000000000000000000000000000000000000000000000000000003)
      mstore(0xE0, 0x2121210000000000000000000000000000000000000000000000000000000000)
      revert(0x9C, 0x64)
    }
  }

  function zeroSelector() public {
    assembly {
    //mstore(0x80, 0x0000000000000000000000000000000000000000000000000000000000000000)
      mstore(0xA0, 0x0000000000000000000000000000000000000000000000000000000000000020)
      mstore(0xC0, 0x0000000000000000000000000000000000000000000000000000000000000003)
      mstore(0xE0, 0x2121210000000000000000000000000000000000000000000000000000000000)
      revert(0x9C, 0x64)
    }
  }

  function shortSelector() public {
    assembly {
      mstore(0x80, 0x00000000000000000000000000000000000000000000000000000000beef0000)
      revert(0x9C, 0x02)
    }
  }

  function shortZeroSelector() public {
    assembly {
    //mstore(0x80, 0x0000000000000000000000000000000000000000000000000000000000000000)
      revert(0x9C, 0x02)
    }
  }

  //I was going to do test of a pointer in the range from -1 to -4, but the problem is,
  //this will make the length way too large regardless of the selector.  So forget it.

  function pointBeforeBeginning() public {
    assembly {
      mstore(0x80, 0x0000000000000000000000000000000000000000000000000000000008c379a0)
      mstore(0xA0, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc0)
      revert(0x9C, 0x24)
    }
  }
}

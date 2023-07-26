//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CastTest {

  enum Ternary {
    Yes, No, MaybeSo
  }

  event enumEvent(Ternary indexed);
  event addressEvent(address indexed);
  event contractEvent(CastTest indexed);
  event functionEvent(function() external indexed);

  function enumTest() public {
    unchecked {
      uint8 byte1 = 0xff;
      uint8 byte2 = 1;
      uint8 sum = byte1 + byte2;
      Ternary cast = Ternary(sum);
      emit enumEvent(cast);
    }
  }

  function addressTest() public {
    unchecked {
      uint160 integer1 = 0x00ffffffffffffffffffffffffffffffffffffffff;
      uint160 integer2 = 1;
      uint160 sum = integer1 + integer2;
      address cast = address(sum);
      emit addressEvent(cast);
    }
  }

  function contractTest() public {
    unchecked {
      uint160 integer1 = 0x00ffffffffffffffffffffffffffffffffffffffff;
      uint160 integer2 = 1;
      uint160 sum = integer1 + integer2;
      CastTest cast = CastTest(address(sum));
      emit contractEvent(cast);
    }
  }

  function functionTest() public {
    unchecked {
      uint160 integer1 = 0x00ffffffffffffffffffffffffffffffffffffffff;
      uint160 integer2 = 1;
      uint160 sum = integer1 + integer2;
      CastTest cast = CastTest(address(sum));
      function() external fn = cast.functionTest;
      emit functionEvent(fn);
    }
  }
}

pragma solidity ^0.5.9;

contract CastTest {

  enum Ternary {
    Yes, No, MaybeSo
  }

  event enumEvent(Ternary indexed);
  event addressEvent(address indexed);
  event contractEvent(CastTest indexed);

  function enumTest() public {
    uint8 byte1 = 0xff;
    uint8 byte2 = 1;
    uint8 sum = byte1 + byte2;
    Ternary cast = Ternary(sum);
    emit enumEvent(cast);
  }

  function addressTest() public {
    uint160 integer1 = 0x00ffffffffffffffffffffffffffffffffffffffff;
    uint160 integer2 = 1;
    uint160 sum = integer1 + integer2;
    address cast = address(sum);
    emit addressEvent(cast);
  }

  function contractTest() public {
    uint160 integer1 = 0x00ffffffffffffffffffffffffffffffffffffffff;
    uint160 integer2 = 1;
    uint160 sum = integer1 + integer2;
    CastTest cast = CastTest(sum);
    emit contractEvent(cast);
  }

  function functionTest() public {
    uint160 integer1 = 0x00ffffffffffffffffffffffffffffffffffffffff;
    uint160 integer2 = 1;
    uint160 sum = integer1 + integer2;
    CastTest cast = CastTest(sum);
    function() external fn = cast.functionTest;
    //I'd emit fn but that'd cause a problem :P
  }
}

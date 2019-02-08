pragma solidity ^0.5.3;

contract IntTest {
  event Done();
  mapping(int8 => int8) slot0;
  function run() public {
    slot0[1] = 1;
    slot0[-1] = -1;
    emit Done();
  }
}

contract ByteTest {
  event Done();
  mapping(byte => byte) slot0;
  function run() public {
    slot0[0x01] = 0x01;
    slot0[0xff] = 0xff;
    emit Done();
  }
}

contract BoolTest {
  event Done();
  mapping(bool => int8) slot0;
  function run() public {
    slot0[true] = 1;
    slot0[false] = -1;
    emit Done();
  }
}

contract AddressTest {
  event Done();
  mapping(address => int8) slot0;
  function run() public {
    slot0[0x0000000000000000000000000000000000000000] = 1;
    emit Done();
  }
}

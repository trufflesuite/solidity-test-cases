pragma solidity ^0.5.10;

contract ContinueTest {
  event Stuff(uint, string, uint);
  function run(uint a,
    uint b,
    uint c) public {
      emit Stuff(a,
       "hoogly\
poog", b + c);
  }
}

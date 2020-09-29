//SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract BytestringTest {
  bytes bs;
  string ss;
  function run() public {
    bytes memory bm;
    string memory sm;
    bs = hex"deadbeef";
    bs[0] = 0xba;
    bs.length = 2;
    bs.length = 33;
    bs.length = 34;
    bs.length = 8;
    bs.push(0xfe);
    bs.pop();
    bm = hex"deadbeef";
    bm[0] = 0xba;
    ss = "hello";
    bytes(ss)[0] = 0x6a;
    bytes(ss)[4] = 0x73;
    bytes(ss).length = 2;
    bytes(ss).length = 33;
    bytes(ss).length = 34;
    bytes(ss).length = 8;
    bytes(ss).push(0x74);
    bytes(ss).pop();
    sm = "hello";
    bytes(sm)[0] = 0x6a;
  }
}

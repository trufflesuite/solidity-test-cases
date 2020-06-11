pragma solidity ^0.5.16;

contract GethTest {
  uint zr;
  uint nzr = 1;
  uint zwz;
  uint zwnz;
  uint nzwz = 2;
  uint nzwnz = 3;
  uint zwr;
  uint nzwr;
  uint multiw;

  function run() public {
    uint x;
    x = zr; //read zero
    x = nzr; //read nonzero
    zwz = 0; //write zero to zero
    zwnz = 4; //write nonzero to zero
    nzwz = 0; //write zero to nonzero
    nzwnz = 5; //write nonzero to nonzero
  }

  function multi() public {
    multiw = 1;
    multiw = 2;
  }
}

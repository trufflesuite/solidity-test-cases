pragma solidity ^0.6.4;

contract Grandparent {
  uint x = 1; //first
  string blorp = "blarp"; //second (but debugger skips it by default)
  uint y;
  constructor(uint it) public {
    y = it;
    z = 4;
  }
  uint z;
  string worgle = "borgle"; //third (but debugger skips it by default)
}

contract Parent is Grandparent {
  uint w = 89; //fourth
  string vlerp = "weerb"; //fifth
  constructor(string memory xorf) public Grandparent(3) {
    zed = 4;
    worf = xorf;
  }
  uint zed;
  string worf;
  string wargle = "bargle"; //sixth
}

contract Test is Parent {
  uint i = 1; //seventh
  string neermpf;
  constructor() public Parent("heeeg") { //last
    neermpf = "hlunge";
  }
  uint j = 2; //eighth
}

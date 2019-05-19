pragma solidity ^0.5.8;

contract DelayTest {

  uint x1;
  uint x2;

  function run() public {
    Boom boom = new Boom(47);
    x1 = boom.it();
    boom.boom();
    x2 = boom.it();
  }
}

contract Boom {

  uint public it;

  function() external payable {
  }

  constructor(uint x) public {
    it = x;
  }

  function boom() public {
    selfdestruct(address(this));
  }
}

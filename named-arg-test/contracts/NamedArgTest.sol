pragma solidity ^0.5.4;

contract NamedArgTest {
  function f(uint x, uint y) public pure returns (uint) {
    return 2*x + y;
  }

  function () external payable {
  }

  function run() public view {
    f({x: 5, y: 3}); //WHAT
    this.f({x: 5, y: 3}); //yup this works too
    TestLib.g({x: 8, y: 3}); //and this of course
    /* none of these work though
    blockhash({blockNumber: block.number});
    assert({condition: true});
    require({condition: true});
    require({condition: true, message: "oops"});
    revert({reason: "no reason"});
    addmod({x: 7, y: 8, k: 10});
    mulmod({x: 7, y: 8, k: 10});
    ecrecover({hash: 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff,
      v: 1, r: 0x0000000000000000000000000000000000000000000000000000000000000000,
      s: 0x0000000000000000000000000000000000000000000000000000000000000001});
    address(this).transfer({amount: 0});
    address(this).send({amount: 0});
    selfdestruct({recipient: address(this)});
    new uint[]({length: 2});
    */
  }
}

library TestLib {
  function g(uint x, uint y) external pure returns (uint) {
    return 3*x + y;
  }
}

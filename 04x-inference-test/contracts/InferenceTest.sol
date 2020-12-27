pragma solidity ^0.4.26;

contract InferenceTest {

  mapping(uint => uint) map;

  function test(uint z) {
    var x = 1;
    map[x] = x;
  }
}

pragma solidity ^0.5.3;
pragma experimental ABIEncoderV2;

contract CalldataPtrTest
{

  event Done();

  function staticTest(uint[3] calldata three, uint[2] calldata two, uint[1] calldata one) external
  {
    uint[3] memory threeMem = three;
    uint[2] memory twoMem = two;
    uint[1] memory oneMem = one;
    emit Done();
  }

  function staticTester() public
  {
    uint[3] memory three;
    three[0] = 7;
    three[1] = 8;
    three[2] = 9;
    uint[2] memory two;
    two[0] = 17;
    two[1] = 18;
    uint[1] memory one;
    one[0] = 35;
    this.staticTest(three, two, one);
  }

  function dynamicTest(uint[3] calldata three, uint[] calldata uints, string calldata hello, uint[1] calldata one) external
  {
    uint[3] memory threeMem = three;
    uint[] memory uintsMem = uints;
    string memory helloMem = hello;
    uint[1] memory oneMem = one;
    emit Done();
  }

  function dynamicTester() public
  {
    uint[3] memory three;
    three[0] = 7;
    three[1] = 8;
    three[2] = 9;
    uint[] memory uints;
    uints = new uint[](2);
    uints[0] = 17;
    uints[1] = 18;
    string memory hello = "Hello world!";
    uint[1] memory one;
    one[0] = 35;
    this.dynamicTest(three, uints, hello, one);
  }

  function dynamicZeroTest(uint[] calldata zero, uint[] calldata one) external
  {
    uint[] memory zeroMem = zero;
    uint[] memory oneMem = one;
    emit Done();
  }

  function dynamicZeroTester() public
  {
    uint[] memory zero;
    uint[] memory one;
    zero = new uint[](0);
    one = new uint[](1);
    one[0] = 35;
    this.dynamicZeroTest(zero, one);
  }

  /*
  struct Pair
  {
    uint x;
    uint y;
  }
  */

  /*
  function structArrayTest(Pair[2] memory pairs) public
  {
    Pair[2] memory pairsMem = pairs;
    emit Done();
  }

  function structArrayTester() public
  {
    Pair[2] memory pairs;
    pairs[0].x = 6;
    pairs[0].y = 7;
    pairs[1].x = 8;
    pairs[1].y = 9;
    this.structArrayTest(pairs);
  }
  */

  /*
  function structTest(Pair calldata pair) external
  {
    Pair memory pairMem = pair;
    emit Done();
  }

  function structTester() public
  {
    Pair memory pair;
    pair.x = 17;
    pair.y = 18;
    this.structTest(pair);
  }
  */

  /*
  function ssTest(uint[2][2] calldata it) external
  {
    uint[2][2] memory mem = it;
    emit Done();
  }

  function sdTest(uint[][2] calldata it) external
  {
    uint[][2] memory mem = it;
    emit Done();
  }

  function dsTest(uint[2][] calldata it) external
  {
    uint[2][] memory mem = it;
    emit Done();
  }

  function ddTest(uint[][] calldata it) external
  {
    uint[][] memory mem = it;
    emit Done();
  }

  function ssTester() public
  {
    uint[2][2] memory it;
    it[0][0] = 6;
    it[0][1] = 7;
    it[1][0] = 8;
    it[1][1] = 9;
    this.ssTest(it);
  }

  function dsTester() public
  {
    uint[2][] memory it;
    it = new uint[2][](2);
    it[0][0] = 6;
    it[0][1] = 7;
    it[1][0] = 8;
    it[1][1] = 9;
    this.dsTest(it);
  }

  function sdTester() public
  {
    uint[][2] memory it;
    it[0] = new uint[](2);
    it[0][0] = 6;
    it[0][1] = 7;
    it[1] = new uint[](2);
    it[1][0] = 8;
    it[1][1] = 9;
    this.sdTest(it);
  }

  function ddTester() public
  {
    uint[][] memory it;
    it = new uint[][](2);
    it[0] = new uint[](2);
    it[0][0] = 6;
    it[0][1] = 7;
    it[1] = new uint[](2);
    it[1][0] = 8;
    it[1][1] = 9;
    this.ddTest(it);
  }
  */

  /*
  struct hasMapping
  {
    uint x;
    mapping(bytes => uint) map;
    uint y;
  }

  function publicMapArg(hasMapping memory arg) public
  {
    emit Done();
  }
  */

  /*
  struct inner
  {
    uint x;
    uint y;
  }

  struct outer
  {
    inner x;
    inner y;
  }

  function publicComplex(outer memory arg) public
  {
    emit Done();
  }
  */
}

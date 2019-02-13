pragma solidity ^0.5.4;
pragma experimental ABIEncoderV2;

contract CalldataTest {

  event Done();

  struct Pair {
    uint x;
    uint y;
  }

  struct ArrayPair {
    uint[2] x;
    uint[2] y;
  }

  struct PairPair {
    Pair x;
    Pair y;
  }

  struct ArrayDynPair {
    uint[] x;
    uint[] y;
  }

  //the following all work now!
  function arrayTest(uint[2] calldata array) external pure returns (uint) {
    return array[0];
  }

  function arrayDynTest(uint[] calldata array) external pure returns (uint) {
    return array.length;
  }

  function arrayArrayTest(uint[2][2] calldata array) external pure returns (uint) {
    return array[0][0];
  }

  function arrayArrayDynTest(uint[2][] calldata array) external pure returns (uint) {
    return array.length;
  }

  function structTest(Pair calldata pair) external pure returns (uint) {
    return pair.x;
  }

  function structArrayTest(Pair[2] calldata array) external pure returns (uint) {
    return array[0].x;
  }

  function structArrayDynTest(Pair[] calldata array) external pure returns (uint) {
    return array.length;
  }

  function arrayStructTest(ArrayPair calldata pair) external pure returns (uint) {
    return pair.x[0];
  }

  function structStructTest(PairPair calldata pair) external pure returns (uint) {
    return pair.x.x;
  }

  function run() public {
    uint[2] memory A;
    uint[] memory D;
    uint[2][2] memory AA;
    uint[2][] memory AD;
    Pair memory S;
    Pair[2] memory SA;
    Pair[] memory SD;
    ArrayPair memory AS;
    PairPair memory SS;
    //not going to bother initializing most of these because that's not the point
    D = new uint[](1);
    AD = new uint[2][](1);
    SD = new Pair[](1);
    this.arrayTest(A);
    this.arrayDynTest(D);
    this.arrayArrayTest(AA);
    this.arrayArrayDynTest(AD);
    this.structTest(S);
    this.structArrayTest(SA);
    this.structArrayDynTest(SD);
    this.arrayStructTest(AS);
    this.structStructTest(SS);
    emit Done();
  }

  //the following still don't
  /*
  function arrayDynArrayTest(uint[][2] calldata array) external pure returns (uint) {
    return array[0].length;
  }

  function arrayDynArrayDynTest(uint[][] calldata array) external pure returns (uint) {
    return array.length;
  }

  function arrayDynStructTest(ArrayDynPair calldata pair) external pure returns (uint) {
    return pair.x.length;
  }
  */
}

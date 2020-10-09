//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

contract SliceTest {

  event Nums(uint[]);
  event Done();
  mapping(bytes => bytes) map;
  mapping(string => string) record;
  mapping(uint => uint[2]) storedPairs;

  function arrayTest(uint[] calldata nums) external {
    uint[] calldata sliced;
    sliced = nums[1 : nums.length - 1];
    emit Nums(sliced);
  }

  function bytesTest(bytes calldata data) external {
    bytes calldata trimmed;
    trimmed = data[1 : data.length - 1];
    map[trimmed] = trimmed;
    emit Done();
  }

  /*
  //Thankfully this is NOT allowed!
  function dynamicTest(string[] calldata strings) external {
    string[] calldata uhoh = strings[1 : strings.length - 1];
    record[uhoh[0]] = uhoh[1];
    emit Done();
  }
  */

  //but this is, interestingly :)
  function staticTest(uint[2][] calldata pairs) external {
    uint[2][] calldata dropped = pairs[1 : pairs.length - 1];
    uint[2] calldata keyPair;
    uint[2] calldata value;
    keyPair = dropped[0];
    value = dropped[1];
    storedPairs[keyPair[0]] = value;
    emit Done();
  }

  function internalTest(bytes calldata x) public returns (bytes calldata out) {
    out = x;
    emit Done();
  }

  function memoryTest(bytes calldata x) public returns (bytes memory out) {
    out = x;
    emit Done();
  }

  function myTester(bytes calldata x) public {
    bytes calldata icc = internalTest(x);
    bytes memory icm = internalTest(x);
    bytes memory imm = memoryTest(x);
    //bytes calldata imc = memoryTest(x); //haha no
    //bytes calldata ecc = this.internalTest(x); //nope! (also crashes in 0.6.9)
    bytes memory ecm = this.internalTest(x); //crashes in 0.6.9
    bytes memory emm = this.memoryTest(x);
    //bytes calldata emc = this.memoryTest(x); //haha no
    internalTest(x);
    memoryTest(x);
    this.internalTest(x); //crashes in 0.6.9
    this.memoryTest(x);
  }
}

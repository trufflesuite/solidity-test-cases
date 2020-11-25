//SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;
pragma abicoder v2;

import "./ATypes.sol";
import "./ZTypes.sol";

contract NoDummyTest {
  A public numlist;
  Z public taglist;

  event Stuff(A nums, Z tags);

  function run(A memory nums, Z memory tags) public returns (A memory numsout, Z memory tagsout) {
    numsout = nums;
    tagsout = tags;
    emit Stuff(nums, tags);
  }
}

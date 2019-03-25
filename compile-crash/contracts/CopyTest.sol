pragma solidity ^0.5.0;

contract CopyTest {

  struct Tree {
    Tree[] children;
  }

  Tree storageTree;

  function run() public {
    Tree memory memoryTree;
    memoryTree = storageTree;
  }

}

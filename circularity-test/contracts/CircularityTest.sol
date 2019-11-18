pragma solidity ^0.5.13;

contract CircularityTest {

  struct Tree {
    uint x;
    Tree[] children;
  }

  event Done();

  function run() public {

    Tree memory simple;
    simple.x = 1;
    simple.children = new Tree[](1);
    simple.children[0].x = 2;

    Tree memory circular;
    circular.x = 3;
    circular.children = new Tree[](1);
    circular.children[0] = circular;

    Tree memory diamond;
    diamond.x = 4;
    diamond.children = new Tree[](2);
    diamond.children[0].x = 5;
    diamond.children[1].x = 6;
    diamond.children[0].children = new Tree[](1);
    diamond.children[0].children[0].x = 7;
    diamond.children[1].children = diamond.children[0].children;

    Tree memory twoLoop;
    twoLoop.x = 8;
    twoLoop.children = new Tree[](2);
    twoLoop.children[0].x = 9;
    twoLoop.children[1].x = 10;
    twoLoop.children[0].children = new Tree[](1);
    twoLoop.children[0].children[0] = twoLoop.children[1];
    twoLoop.children[1].children = new Tree[](1);
    twoLoop.children[1].children[0] = twoLoop.children[0];

    emit Done();
  }
}

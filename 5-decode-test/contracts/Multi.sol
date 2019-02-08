pragma solidity ~0.5;

contract Test1
{
  uint[] arr;

  function run() public
  {
    arr = [0,1,2];
  }
}

contract Test2
{
  uint240[] arr;

  function run() public
  {
    arr = [22,23,24];
  }
}

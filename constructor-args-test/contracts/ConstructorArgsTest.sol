pragma solidity ^0.5.7;

contract Tester {
  function run() public {
    new TakesBytes4(0xdeadbeef);
    new TakesString("hello");
    bytes4[2] memory arr;
    arr[0] = 0xdeadbeef;
    arr[1] = 0xdeadbeef;
    new TakesBytesArr(arr);
  }
}

contract TakesBytes4 {

  bytes4 someBytes;

  constructor(bytes4 _someBytes) public {
    someBytes = _someBytes;
  }
}

contract TakesString {

  string str;

  constructor(string memory _str) public {
    str = _str;
  }
}

contract TakesBytesArr {

  bytes4[2] arr;

  constructor (bytes4[2] memory _arr) public {
    arr = _arr;
  }
}

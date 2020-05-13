pragma solidity ^0.6.7;
pragma experimental ABIEncoderV2;

contract DebugReturnTest {

  event Done();

  struct Greeting {
    string hello;
    string goodbye;
  }

  enum Result {
    Success,
    SD,
    Assembly
  }

  //case 1 (length = 1) WORKS
  //case 2 (length = 0) WORKS
  //case 5a (length = 2) WORKS
  //case 9a (length = 3) WORKS
  fallback() external {
    if(msg.data.length == 1) {
      assembly {
        return(0x60, 0x20)
      }
    } else if(msg.data.length == 2) {
      revert();
    } else if(msg.data.length == 3) {
      revert("Three!");
    }
  }

  //case 3 WORKS
  function cantDecode() public returns (uint) {
    emit Done();
    assembly {
      return(0x60, 0x10)
    }
  }

  //case 4a N/A
  function boom() public returns (uint) {
    selfdestruct(tx.origin);
  }

  //case 5b WORKS
  function failNumber() public returns (uint) {
    emit Done();
    revert();
  }

  //case 5c WORKS 
  function fail() public {
    emit Done();
    revert();
  }

  //case 4b WORKS
  //case 6 WORKS
  //case 8a WORKS
  constructor(Result result) public {
    if(result == Result.SD) {
      selfdestruct(tx.origin);
    } else if(result == Result.Assembly) {
      assembly {
        return(0x60, 0x20)
      }
    }
  }

  //case 7 WORKS
  function stuff() public {
    emit Done();
  }

  //case 9b WORKS
  function failNoisy() public returns (uint) {
    emit Done();
    revert("Noise!");
  }

  //case 9c WORKS
  function failMessy() public returns (uint) {
    emit Done();
    bytes memory mess = hex'A1A1A1';
    revert(string(mess));
  }

  //case 10a WORKS
  function returnStruct() public returns (Greeting memory) {
    emit Done();
    return Greeting("this is a very long hello!", "this is a very long goodbye!");
  }

  //case 10b WORKS
  function returnMultiple() public returns (Greeting memory guest, Greeting memory) {
    emit Done();
    Greeting memory it = Greeting("this is a very long hello!", "this is a very long goodbye!");
    return (it, it);
  }
}

library DebugReturnLibrary {
  //case 8b WORKS
}

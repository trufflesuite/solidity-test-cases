pragma solidity ^0.5.1;

contract KnownContract {
  function sendValue(uint gaslimit, uint gasprice) external payable {
    uint x = msg.value;
    require(msg.value == gaslimit * gasprice, "msg.value must == gaslimit * gasprice");
    address payable someAddress = address(0);
    someAddress.transfer(gaslimit * gasprice);     
    x = msg.value;
  }
}

contract Contract {

  KnownContract knownContract;

  function() payable external {}

  constructor(KnownContract it) public {
    knownContract = it;
  }

  function callKnownContract(uint gaslimit, uint gasprice) public payable {
    uint x = msg.value;
    knownContract.sendValue.value(gaslimit * gasprice)(gaslimit, gasprice);
    x = msg.value;
    knownContract.sendValue.value(gaslimit * gasprice)(gaslimit, gasprice);
    x = msg.value;
  }
}

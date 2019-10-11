pragma solidity ^0.5.11;

contract BadTransferTest {

  Recipient recipient;

  constructor() public {
    recipient = new Recipient();
  }

  event Uint(uint);

  function run() public {
    emit Uint(recipient.run.value(address(this).balance + 1 wei)());
  }
}

contract Recipient {
  function run() public payable returns (uint) {
    return 1;
  }
}

pragma solidity ^0.5.5;

contract CantCreate {
  constructor() public {
    revert("Nope!");
  }
}

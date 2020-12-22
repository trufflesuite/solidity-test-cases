pragma solidity ^0.5.10;

contract SolTestTest {
  event Here();

  function run(bool success) public {
    emit Here();
    if (!success) {
      revert("Nope!");
    }
  }
}

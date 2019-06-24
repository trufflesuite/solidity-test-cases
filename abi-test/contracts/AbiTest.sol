pragma solidity ^0.5.9;
pragma experimental ABIEncoderV2;

contract AbiTest {

  struct IntAndString {
    int x;
    string name;
  }

  struct NotQuiteIntAndString {
    int y;
    string nomen;
  }

  event IntEvent(int);
  event StringEvent(string);

  function takesStruct(IntAndString memory it) public {
    emit IntEvent(it.x);
    emit StringEvent(it.name);
  }
}

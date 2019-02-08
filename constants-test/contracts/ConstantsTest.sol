pragma solidity ^0.5.3;

contract ConstantsTest {

  event Done();

  enum TriState {
    yes, no, maybeSo
  }

  uint constant one = 1;
  int constant longMinus = -1;
  int128 constant shortMinus = -1;
  byte constant byte255 = 0xff;
  bool constant verity = true;
  address constant addressOne = 0x0000000000000000000000000000000000000001;
  string constant hello = "hello";
  bytes constant deadbeef = hex"deadbeef";
  TriState constant whoKnows = TriState.maybeSo;
  ConstantsTest constant contractOne = ConstantsTest(0x0000000000000000000000000000000000000001);
  //function () internal constant intRun = run;
  //function () external constant extRun = this.run;
  uint constant simpleIntExpression = 3 + 5;
  uint constant intExpression = false ? 3 : 5;
  //byte constant byteExpression = false ? 0xff : 0xfe;
  bool constant boolExpression = false ? false : true;
  address constant addressExpression = false ? 0x0000000000000000000000000000000000000001 : 0x0000000000000000000000000000000000000002;
  string constant stringExpression = false ? "hello" : "goodbye";
  //bytes constant bytesExpression = false ? hex"deadbeef" : hex"1337";
  TriState constant enumExpression = false ? TriState.yes : TriState.no;
  ConstantsTest constant contractExpression = false ? ConstantsTest(0x0000000000000000000000000000000000000001) : ConstantsTest(0x0000000000000000000000000000000000000002);

  function run() public {
    emit Done();
  }
}

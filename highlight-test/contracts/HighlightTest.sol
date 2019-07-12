pragma solidity ^0.5.10; //for compiling
pragma experimental ABIEncoderV2; //for dynamicing

contract HighlightTest { //for highlighting

  string split = "look\
look"; //looklook!

  mapping(string => uint) public mapper; //for mapping

  event Fooft(string s, address it); //for emitting

  function decoy(address x) public { //for returning
    emit Fooft("woggle", x); //for displaying
  }

  function run(string[3] memory args) public returns (function(address) external value) { //for running
    mapper["hooblyforst"] = 3 finney; //RIP Hal
    mapper["zoolo"] = tx.gasprice; //for pricing
    if(bytes(args[0]).length == this.mapper(args[1]) + this.mapper(args[2])) { //for switching
      mapper[args[0]] = uint(address(this)); //for weirding
    }
    else { //for elsing
      value = this.decoy; //for setting
    }
    value(address(this)); //for calling
  }
}

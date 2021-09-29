//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//things to test:
//foreign UDVTs
//free UDVTs
//UDVTs as keys

//what types are allowed as UDVTs?

type OurUint is uint;

contract UDVTs {
  type MyUint is uint;

  mapping(MyUint => uint) mappy;

  enum Color { Red, Green, Blue }

  function envelop(uint x) public pure returns (MyUint) {
    return MyUint.wrap(x);
  }

  function exoticstamp(uint x) public pure returns (Foreign.YourUint) {
    return Foreign.YourUint.wrap(x);
  }

  function globalstamp(uint x) public pure returns (OurUint) {
    return OurUint.wrap(x);
  }

  type MyFixed is fixed;
  type MyWord is bytes32;
  //type MyColor is Color; //nope!
  type MyBool is bool;
  type MyAddress is address;
  //type MyContract is UDVTs; //nope!
  //type MyOutFn is function(uint) external returns (Foreign.YourUint); //nope!
  //type MyInFn is function(uint) internal returns (Foreign.YourUint); //nope!
  //type MyIndirect is MyUint; //nope!
  //type MyString is string; //hell no
  //type MyBytes is bytes; //hell no
  //type MyArray is uint[2]; //hell no
}

contract Foreign {
  type YourUint is uint;

  function exoticstamp(uint x) public pure returns (YourUint) {
    return YourUint.wrap(x);
  }
}

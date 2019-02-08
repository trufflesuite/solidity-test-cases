pragma solidity ^0.4.25;

contract ViewTest {

  uint8 private implicit;
  uint8 private explicit;
  uint8 private dummy;

  function run(uint8 _implicit, uint8 _explicit, uint8 _dummy) public
  {
    Container values = new Container(_implicit, _explicit);

    implicit = values.implicit();
    explicit = values.getExplicit();
    dummy = _dummy;
  }
}

contract Container {
  
  uint8 public implicit;
  uint8 private explicit;

  function getExplicit() public view returns (uint8)
  {
    return explicit;
  }

  constructor(uint8 _implicit, uint8 _explicit) public
  {
    implicit = _implicit;
    explicit = _explicit;
  }
}

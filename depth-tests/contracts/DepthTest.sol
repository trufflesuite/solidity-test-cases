pragma solidity ^0.5.0;

contract DepthTest {

  Secondary secondary;

  function run() public {
    secondary.doStuff();
    DepthLibrary.doStuff(DepthLibrary.Color.Red);
  }

  constructor(Secondary it) public {
    secondary = it;
    secondary.doStuff();
    DepthLibrary.doStuff(DepthLibrary.Color.Green);
  }

  function() external {
    secondary.doStuff();
    DepthLibrary.doStuff(DepthLibrary.Color.Blue);
  }
}

contract Secondary {

  event Here();

  function doStuff() public {
    emit Here();
  }
}

library DepthLibrary {
  enum Color { Red, Green, Blue }
  event Show(Color);

  function doStuff(Color color) external {
    emit Show(color);
  }
}

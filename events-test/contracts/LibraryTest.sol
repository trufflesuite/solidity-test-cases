//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract EmitsLibraries {
  event Native();
  function callsInternal() public {
    emit Native();
    Emitter.emitInternal();
    emit Native();
  }
  function callsExternal() public {
    emit Native();
    Emitter.emitExternal();
    emit Native();
  }
}

library Emitter {
  event Internal();
  event External();
  function emitInternal() internal {
    emit Internal();
  }
  function emitExternal() external {
    emit External();
  }
}

contract TheContract {
  event SameName();
  function run() public {
    emit SameName();
    Library1.run();
    Library2.run();
  }
}

library Library1 {
  event SameName();
  function run() external {
    emit SameName();
  }
}

library Library2 {
  event SameName();
  function run() external {
    emit SameName();
  }
}

pragma solidity ^0.5.9;

contract EmitsLibraries {
  event Native();
  function callsInternal() public {
    emit Native();
    Emitter.emitInternal();
    emit Native();
  }
  function callsExternal() public {
    emit Native();
    Emitter.emitInternal();
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

pragma solidity ^0.5.10;

contract Demo {

  mapping(bytes8 => function() internal) dispatcher;
  Registry registry;

  constructor() public {
    dispatcher[0xdeadbeefdeadbeef] = startRegistry;
  }

  function longDispatch(bytes8 longSig) external {
    function() internal toCall = dispatcher[longSig];
    toCall();
  }

  function startRegistry() private {
    registry = new TrackedRegistry();
    bytes memory contractSig = bytes(type(Demo).name);
    function(bytes memory) external register = registry.register;
    register(contractSig);
  }
}

contract Registry {

  mapping(address => bytes) registry;

  function register(bytes memory contractSig) public {
    address sender = msg.sender;
    registry[sender] = contractSig;
  }
}

contract TrackedRegistry is Registry {

  address[] keys;

  function register(bytes memory contractSig) public {
    address sender = msg.sender;
    super.register(contractSig);
    keys.push(sender);
  }
}

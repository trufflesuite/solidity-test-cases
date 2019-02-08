const __FACTORIAL2 =
`
pragma solidity ^0.4.25;

contract FactorialTest2 {

  uint public result;

  function run(uint n) public returns (uint factorial)
  {
    FactorialTester test = new FactorialTester(n, this);
    factorial = test.factorial();
  }
}

contract FactorialTester {

  uint public level;
  uint public factorial;
  uint public duplicateFactorial;

  constructor(uint n, FactorialTest2 parent) public
  {
    uint prevFac;
    factorial = n;
    level = n; //break here (24)
    if(n == 0)
    {
      factorial = 1;
    }
    else
    {
      prevFac = parent.run(n - 1);
      factorial = n * prevFac;
    }
    duplicateFactorial = factorial; //break here (34)
  }
}
`;

  it("Correctly handles nested creation calls", async function() {
    let instance = await abstractions.FactorialTest2.deployed();
    let receipt = await instance.run(1);
    let txHash = receipt.tx;

    let bugger = await Debugger.forTx(txHash, {
      provider,
      contracts: artifacts
    });

    let session = bugger.connect();
    debug("sourceId %d", session.view(solidity.current.source).id);

    session.addBreakpoint({sourceId: 2, line: 24});
    session.addBreakpoint({sourceId: 2, line: 34});

    var values = [];

    session.continueUntilBreakpoint();
    while(!session.view(trace.finished))
    {
      values.push(session.view(data.current.identifiers.native)["factorial"]);
      session.continueUntilBreakpoint();
    }

    assert.deepEqual(values, [1, 0, 1, 1]);
  });

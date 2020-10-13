module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    }
  },
  compilers:
  {
    solc:
    {
      version: "0.7.3",
      settings: {
        metadata: {
          bytecodeHash: "none"
        },
        optimizer: {
          enabled: true,
          runs: 2147483647,
          details: {
            orderLiterals: true,
            deduplicate: true,
            cse: true,
            constantOptimizer: true,
            yulDetails: {
              optimizerSteps: "flcCUnDvejsxIOoighTLMrRmVatud"
            }
          }
        }
      }
    }
  }
};

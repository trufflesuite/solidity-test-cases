var StacktraceTest = artifacts.require("StacktraceTest");

module.exports = function(deployer) {
  deployer.deploy(StacktraceTest, { value: 1} );
};

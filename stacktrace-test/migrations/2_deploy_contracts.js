var StacktraceTest = artifacts.require("StacktraceTest");

module.exports = function(deployer) {
  deployer.deploy(StacktraceTest, true, { value: 1} );
};

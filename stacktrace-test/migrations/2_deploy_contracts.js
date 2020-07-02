var StacktraceTest = artifacts.require("StacktraceTest");
var InternalTest = artifacts.require("InternalTest");

module.exports = function(deployer) {
  deployer.deploy(StacktraceTest, 0, { value: 1} );
  deployer.deploy(InternalTest);
};

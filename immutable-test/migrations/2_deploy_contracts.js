var ImmutableTest = artifacts.require("ImmutableTest");
var AssignementTest = artifacts.require("AssignmentTest");
var MixedTest = artifacts.require("MixedTest");
var Derived = artifacts.require("Derived");
var ErrorTest = artifacts.require("ErrorTest");

module.exports = function(deployer) {
  deployer.deploy(ImmutableTest, "hello", 9, "0xff", "goodbye");
  deployer.deploy(AssignmentTest);
  deployer.deploy(Derived);
  deployer.deploy(MixedTest);
  deployer.deploy(ErrorTest);
};

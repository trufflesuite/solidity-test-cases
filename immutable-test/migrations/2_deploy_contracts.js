var ImmutableTest = artifacts.require("ImmutableTest");
var MixedTest = artifacts.require("MixedTest");
var Derived = artifacts.require("Derived");

module.exports = function(deployer) {
  deployer.deploy(ImmutableTest, "hello", 9, "0xff", "goodbye");
  deployer.deploy(Derived);
  deployer.deploy(MixedTest);
};

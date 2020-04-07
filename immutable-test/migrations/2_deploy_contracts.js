var ImmutableTest = artifacts.require("ImmutableTest");

module.exports = function(deployer) {
  deployer.deploy(ImmutableTest, "hello", 9, "0xff", "goodbye");
};

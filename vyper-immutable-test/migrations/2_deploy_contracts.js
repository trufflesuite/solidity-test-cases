const ImmutableTest = artifacts.require("ImmutableTest");

module.exports = function(deployer) {
  deployer.deploy(ImmutableTest, 107);
};

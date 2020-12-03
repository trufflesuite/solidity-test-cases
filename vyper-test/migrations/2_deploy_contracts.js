const SelfBalanceTest = artifacts.require("SelfBalanceTest");

module.exports = function(deployer) {
  deployer.deploy(SelfBalanceTest);
};

const SelfBalanceTest = artifacts.require("SelfBalanceTest");
const Vyper2 = artifacts.require("Vyper2");

module.exports = function(deployer) {
  deployer.deploy(SelfBalanceTest);
  deployer.deploy(Vyper2);
};

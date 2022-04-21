const AllocTest = artifacts.require("AllocTest");
const Repro = artifacts.require("Repro");

module.exports = function(deployer) {
  deployer.deploy(AllocTest);
  deployer.deploy(Repro);
};

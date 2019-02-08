var PreallocTest = artifacts.require("PreallocTest");
var ConstAndDerived = artifacts.require("ConstAndDerived");
var EnumTest = artifacts.require("EnumTest");

module.exports = function(deployer) {
  deployer.deploy(PreallocTest);
  deployer.deploy(ConstAndDerived);
  deployer.deploy(EnumTest);
};

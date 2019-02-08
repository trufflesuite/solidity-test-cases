var ElementaryTest = artifacts.require("ElementaryTest");
var SpliceTest = artifacts.require("SpliceTest");
var ConstantKeyTest = artifacts.require("ConstantKeyTest");

module.exports = function(deployer) {
  deployer.deploy(ElementaryTest);
  deployer.deploy(SpliceTest);
  deployer.deploy(ConstantKeyTest);
};

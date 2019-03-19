var ElementaryTest = artifacts.require("ElementaryTest");
var SpliceTest = artifacts.require("SpliceTest");
var ConstantKeyTest = artifacts.require("ConstantKeyTest");
var CalldataTest = artifacts.require("CalldataTest");

module.exports = function(deployer) {
  deployer.deploy(ElementaryTest);
  deployer.deploy(SpliceTest);
  deployer.deploy(ConstantKeyTest);
  deployer.deploy(CalldataTest);
};

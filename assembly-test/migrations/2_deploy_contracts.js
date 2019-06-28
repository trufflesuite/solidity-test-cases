var AssemblyTest = artifacts.require("AssemblyTest");
var TwoTest = artifacts.require("TwoTest");

module.exports = function(deployer) {
  deployer.deploy(AssemblyTest);
  deployer.deploy(TwoTest);
};

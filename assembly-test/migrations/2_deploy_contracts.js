var AssemblyTest = artifacts.require("AssemblyTest");
var ScopesTest = artifacts.require("ScopesTest");
var TwoTest = artifacts.require("TwoTest");
var RecursionTest = artifacts.require("RecursionTest");

module.exports = function(deployer) {
  deployer.deploy(AssemblyTest);
  deployer.deploy(ScopesTest);
  deployer.deploy(TwoTest);
  deployer.deploy(RecursionTest);
};

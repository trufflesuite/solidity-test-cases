var ScopesTest = artifacts.require("ScopesTest");
var StepTest = artifacts.require("StepTest");
var RecursionTest = artifacts.require("RecursionTest");

module.exports = function(deployer) {
  deployer.deploy(ScopesTest);
  deployer.deploy(StepTest);
  deployer.deploy(RecursionTest);
};

var ScopesTest = artifacts.require("ScopesTest");
var RecursionTest = artifacts.require("RecursionTest");

module.exports = function(deployer) {
  deployer.deploy(ScopesTest);
  deployer.deploy(RecursionTest);
};

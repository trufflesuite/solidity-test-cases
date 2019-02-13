var NamedArgTest = artifacts.require("NamedArgTest");
var TestLib = artifacts.require("TestLib");

module.exports = function(deployer) {
  deployer.deploy(TestLib);
  deployer.link(TestLib, NamedArgTest);
  deployer.deploy(NamedArgTest);
};

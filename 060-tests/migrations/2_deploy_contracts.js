var Test = artifacts.require("Test");
var ModifierTest = artifacts.require("ModifierTest");

module.exports = function(deployer) {
  deployer.deploy(Test);
  deployer.deploy(ModifierTest);
};

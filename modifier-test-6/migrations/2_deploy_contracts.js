var ModifierTest = artifacts.require("ModifierTest");
var ConstructorJunkTest = artifacts.require("ConstructorJunkTest");

module.exports = function(deployer) {
  deployer.deploy(ModifierTest);
  deployer.deploy(ConstructorJunkTest);
};

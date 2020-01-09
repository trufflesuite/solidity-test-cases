var ModifierTest = artifacts.require("ModifierTest");
var ConstructorJunkTest = artifacts.require("ConstructorJunkTest");
var DepthTest = artifacts.require("DepthTest");

module.exports = function(deployer) {
  deployer.deploy(ModifierTest);
  deployer.deploy(ConstructorJunkTest);
  deployer.deploy(DepthTest);
};

var GlobalTest = artifacts.require("GlobalTest");
var CreationTest = artifacts.require("CreationTest");
var GlobalTestLib = artifacts.require("GlobalTestLib");

module.exports = function(deployer) {
  deployer.deploy(GlobalTestLib);
  deployer.link(GlobalTestLib, GlobalTest);
  deployer.deploy(GlobalTest);
  deployer.deploy(CreationTest, 22, {value: 100});
};

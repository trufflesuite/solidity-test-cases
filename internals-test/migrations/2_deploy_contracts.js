var InvalidTest = artifacts.require("InvalidTest");
var InvalidLibTest = artifacts.require("InvalidLibTest");
var InvalidLib = artifacts.require("InvalidLib");
var ConstructorTest = artifacts.require("ConstructorTest");

module.exports = function(deployer) {
  deployer.deploy(InvalidTest);
  deployer.deploy(InvalidLib);
  deployer.link(InvalidLib, InvalidLibTest);
  deployer.deploy(InvalidLibTest);
  deployer.deploy(ConstructorTest);
};
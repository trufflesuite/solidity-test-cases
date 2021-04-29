var AuxLib = artifacts.require("AuxLib");
var RevertTest = artifacts.require("RevertTest");

module.exports = function(deployer) {
  deployer.deploy(AuxLib);
  deployer.link(AuxLib, RevertTest);
  deployer.deploy(RevertTest);
};

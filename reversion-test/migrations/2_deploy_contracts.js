var RevertTest = artifacts.require("RevertTest");
var RevertTest2 = artifacts.require("RevertTest2");
var RevertEvent = artifacts.require("RevertEvent");

module.exports = function(deployer) {
  deployer.deploy(RevertTest);
  deployer.deploy(RevertTest2);
  deployer.deploy(RevertEvent);
};

var RevertTest = artifacts.require("RevertTest");
var RevertTest2 = artifacts.require("RevertTest2");

module.exports = function(deployer) {
  deployer.deploy(RevertTest);
  deployer.deploy(RevertTest2);
};

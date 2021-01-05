var CatchTest = artifacts.require("CatchTest");
var RevertTest = artifacts.require("RevertTest");

module.exports = function(deployer) {
  deployer.deploy(CatchTest);
  deployer.deploy(RevertTest);
};

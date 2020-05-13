var DebugReturnTest = artifacts.require("DebugReturnTest");
var DebugReturnLibrary = artifacts.require("DebugReturnLibrary");

module.exports = function(deployer) {
  deployer.deploy(DebugReturnTest, 0);
  deployer.deploy(DebugReturnLibrary);
};

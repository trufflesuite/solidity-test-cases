var ManualZeroTest = artifacts.require("ManualZeroTest");
var MultiReturnTest = artifacts.require("MultiReturnTest");

module.exports = function(deployer) {
  deployer.deploy(ManualZeroTest);
  deployer.deploy(MultiReturnTest);
};

var EmptyTest = artifacts.require("EmptyTest");
var MultiEmptyTest = artifacts.require("MultiEmptyTest");

module.exports = function(deployer) {
  deployer.deploy(EmptyTest);
  deployer.deploy(MultiEmptyTest);
};

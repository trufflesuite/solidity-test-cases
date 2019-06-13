var EmptyTest = artifacts.require("EmptyTest");
var MultiEmptyTest = artifacts.require("MultiEmptyTest");
var CallEmptyTest = artifacts.require("CallEmptyTest");
var EmptyMultiTest = artifacts.require("EmptyMultiTest");

module.exports = function(deployer) {
  deployer.deploy(EmptyTest);
  deployer.deploy(MultiEmptyTest);
  deployer.deploy(CallEmptyTest);
  deployer.deploy(EmptyMultiTest);
};

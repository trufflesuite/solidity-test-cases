var SimpleAllocTest = artifacts.require("SimpleAllocTest");
var ConstTest = artifacts.require("ConstTest");
var TooManyVarsTest = artifacts.require("TooManyVarsTest");

module.exports = function(deployer) {
  deployer.deploy(SimpleAllocTest);
  deployer.deploy(ConstTest);
  deployer.deploy(TooManyVarsTest);
};

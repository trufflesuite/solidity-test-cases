var CallTest = artifacts.require("CallTest");
var OverloadTest = artifacts.require("OverloadTest");

module.exports = function(deployer) {
  deployer.deploy(CallTest);
  deployer.deploy(OverloadTest);
};

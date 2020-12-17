var FallbackTest = artifacts.require("FallbackTest");
var OffBaseTest = artifacts.require("OffBaseTest");
var SigTest = artifacts.require("SigTest");

module.exports = function(deployer) {
  deployer.deploy(FallbackTest);
  deployer.deploy(OffBaseTest);
  deployer.deploy(SigTest);
};

var OverflowTest = artifacts.require("OverflowTest");
var CastTest = artifacts.require("CastTest");

module.exports = function(deployer) {
  deployer.deploy(OverflowTest);
  deployer.deploy(CastTest);
};

const VyperTest = artifacts.require("VyperTest");

module.exports = function(deployer) {
  deployer.deploy(VyperTest);
};

const InternalsTest = artifacts.require("InternalsTest");

module.exports = function(deployer) {
  deployer.deploy(InternalsTest);
};

var ErrorTest = artifacts.require("ErrorTest");

module.exports = function(deployer) {
  deployer.deploy(ErrorTest, 0);
};

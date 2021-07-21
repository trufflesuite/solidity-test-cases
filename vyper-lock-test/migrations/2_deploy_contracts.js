const LockTest = artifacts.require("LockTest");

module.exports = function(deployer) {
  deployer.deploy(LockTest);
};

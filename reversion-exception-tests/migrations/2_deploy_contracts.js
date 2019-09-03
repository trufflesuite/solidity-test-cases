var ExceptionTest = artifacts.require("ExceptionTest");

module.exports = function(deployer) {
  deployer.deploy(ExceptionTest, 0);
};

var Tester = artifacts.require("Tester");
var InvalidTest = artifacts.require("InvalidTest");

module.exports = function(deployer) {
  deployer.deploy(Tester);
  deployer.deploy(InvalidTest);
};

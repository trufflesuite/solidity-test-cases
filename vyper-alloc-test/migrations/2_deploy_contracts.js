const AllocTest = artifacts.require("AllocTest");

module.exports = function(deployer) {
  deployer.deploy(AllocTest, -1, "0123456789", -16, [51, 52], -256);
};

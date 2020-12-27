const AllocTest = artifacts.require("AllocTest");

module.exports = function(deployer) {
  deployer.deploy(AllocTest, -1, "ABC", -16, "DEFG", -256, "HIJKL");
};

var GasTest = artifacts.require("GasTest");

module.exports = function(deployer) {
  deployer.deploy(GasTest, {value: 100});
};

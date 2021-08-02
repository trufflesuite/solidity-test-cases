var AccessTest = artifacts.require("AccessTest");
var Auxiliary = artifacts.require("Auxiliary");

module.exports = async function(deployer) {
  await deployer.deploy(Auxiliary);
  let aux = await Auxiliary.deployed();
  await deployer.deploy(AccessTest, aux.address);
};

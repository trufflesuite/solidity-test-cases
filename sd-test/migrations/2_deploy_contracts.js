var Tester = artifacts.require("Tester");
var DelayTest = artifacts.require("DelayTest");
var NoBoom = artifacts.require("NoBoom");
var RevertTest = artifacts.require("RevertTest");

module.exports = async function(deployer) {
  await deployer.deploy(Tester);
  await deployer.deploy(DelayTest);
  await deployer.deploy(NoBoom);
  const noboom = await NoBoom.deployed();
  await deployer.deploy(RevertTest, noboom.address);
};

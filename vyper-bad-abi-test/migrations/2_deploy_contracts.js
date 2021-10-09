const BadAbiTest = artifacts.require("BadAbiTest");
const Caller = artifacts.require("Caller");

module.exports = async function(deployer) {
  await deployer.deploy(BadAbiTest);
  const instance = await BadAbiTest.deployed();
  await deployer.deploy(Caller, instance.address);
};

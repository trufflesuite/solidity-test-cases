const TraceTest = artifacts.require("TraceTest");
const Caller = artifacts.require("Caller");

module.exports = async function(deployer) {
  await deployer.deploy(TraceTest);
  test = await TraceTest.deployed();
  await deployer.deploy(Caller, test.address);
};

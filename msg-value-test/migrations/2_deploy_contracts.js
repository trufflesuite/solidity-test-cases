var KnownContract = artifacts.require("KnownContract");
var Contract = artifacts.require("Contract");

module.exports = async function(deployer) {
  await deployer.deploy(KnownContract);
  let knownContract = await KnownContract.deployed();
  await deployer.deploy(Contract, knownContract.address);
};

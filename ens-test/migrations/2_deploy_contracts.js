const EnsTest = artifacts.require("EnsTest");

module.exports = async function(deployer, _, accounts) {
  const name = "works.eth";
  await deployer.ens.setAddress(name, accounts[0], { from: accounts[0] });
  await deployer.ens.ensjs.setReverseRecord(name); //hopefully this sets it for accounts[0]??
  const registryAddress = deployer.ens.devRegistry.address;
  await deployer.deploy(EnsTest, accounts[0], accounts[1], registryAddress);
};

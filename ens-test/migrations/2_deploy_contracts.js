const EnsTest = artifacts.require("EnsTest");

module.exports = async function(deployer, _, accounts) {
  const name = "works.eth";
  await deployer.ens.setAddress(name, accounts[0], { from: accounts[0] });
  //confirm
  //console.log("addr for 1st: %s", await deployer.ens.ensjs.name(name).getAddress());
  //console.log("owner for sym: %s", await deployer.ens.ensjs.name("addr.reverse").getOwner());
  const registryAddress = deployer.ens.devRegistry.address;
  //console.log("reg addr: %s", registryAddress);
  const rcpt = await deployer.ens.ensjs.setReverseRecord(name); //hopefully this sets it for accounts[0]??
  //confirm
  //console.log("rcpt: %O", rcpt);
  //console.log("name for 1st: %o", await deployer.ens.ensjs.getName(accounts[0]));
  await deployer.deploy(EnsTest, accounts[0], accounts[1], registryAddress);
};

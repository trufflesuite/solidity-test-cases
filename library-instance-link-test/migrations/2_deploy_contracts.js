const UsesLibrary = artifacts.require("UsesLibrary");
const TheLibrary = artifacts.require("TheLibrary");

module.exports = async function(deployer) {
  await deployer.deploy(TheLibrary);
  //await deployer.link(TheLibrary, UsesLibrary);
  theLibrary = await TheLibrary.new();
  await deployer.link(theLibrary, UsesLibrary);
  await deployer.deploy(UsesLibrary);
};

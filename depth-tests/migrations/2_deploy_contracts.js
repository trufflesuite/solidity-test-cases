const DepthTest = artifacts.require("DepthTest");
const Secondary = artifacts.require("Secondary");
const DepthLibrary = artifacts.require("DepthLibrary");

module.exports = async function(deployer) {
  await deployer.deploy(DepthLibrary);
  await deployer.link(DepthLibrary, DepthTest);
  await deployer.deploy(Secondary);
  const secondary = await Secondary.deployed();
  await deployer.deploy(DepthTest, secondary.address);
};

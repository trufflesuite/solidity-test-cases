let Outer = artifacts.require("Outer");
let OuterAddress = artifacts.require("OuterAddress");
let Inner = artifacts.require("Inner");
let InnerLib = artifacts.require("InnerLib");

module.exports = async function(deployer) {
  await deployer.deploy(InnerLib);
  await deployer.deploy(Inner);
  await deployer.link(InnerLib, Outer);
  const inner = await Inner.deployed();
  await deployer.deploy(Outer, inner.address);
  await deployer.deploy(OuterAddress, inner.address);
};

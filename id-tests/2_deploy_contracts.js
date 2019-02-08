let Intervening = artifacts.require("Intervening");
let AddressTest = artifacts.require("AddressTest");
let FactorialTest = artifacts.require("FactorialTest");
let FactorialTest2 = artifacts.require("FactorialTest2");
let InterveningLib = artifacts.require("InterveningLib");

module.exports = async function(deployer) {
  await deployer.deploy(InterveningLib);
  await deployer.link(InterveningLib, Intervening);
  await deployer.deploy(Intervening);
  await deployer.deploy(AddressTest);
  await deployer.deploy(FactorialTest);
  await deployer.deploy(FactorialTest2);
};

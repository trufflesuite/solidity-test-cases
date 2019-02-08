let Storage = artifacts.require("Storage");
let Memory = artifacts.require("Memory");
let Test1 = artifacts.require("Test1");
let Test2 = artifacts.require("Test2");

module.exports = async function(deployer) {
  await deployer.deploy(Storage);
  await deployer.deploy(Memory);
  await deployer.deploy(Test1);
  await deployer.deploy(Test2);
};

var UDVTs = artifacts.require("UDVTs");
var StorageTest = artifacts.require("StorageTest");
var MappingKeyTest = artifacts.require("MappingKeyTest");
var OtherTests = artifacts.require("OtherTests");

module.exports = function(deployer) {
  deployer.deploy(UDVTs);
  deployer.deploy(StorageTest);
  deployer.deploy(MappingKeyTest);
  deployer.deploy(OtherTests);
};

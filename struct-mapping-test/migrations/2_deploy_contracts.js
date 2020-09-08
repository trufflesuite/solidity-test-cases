var StructMappingTest = artifacts.require("StructMappingTest");
var EmptyStructTest = artifacts.require("EmptyStructTest");
var SAMTest = artifacts.require("SAMTest");

module.exports = function(deployer) {
  deployer.deploy(StructMappingTest);
  deployer.deploy(EmptyStructTest);
  deployer.deploy(SAMTest);
};

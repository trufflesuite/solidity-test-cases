var StructMappingTest = artifacts.require("StructMappingTest");
var EmptyStructTest = artifacts.require("EmptyStructTest");

module.exports = function(deployer) {
  deployer.deploy(StructMappingTest);
  deployer.deploy(EmptyStructTest);
};

var IntTest = artifacts.require("IntTest");
var ByteTest = artifacts.require("ByteTest");
var BoolTest = artifacts.require("BoolTest");
var AddressTest = artifacts.require("AddressTest");

module.exports = function(deployer) {
  deployer.deploy(IntTest);
  deployer.deploy(ByteTest);
  deployer.deploy(BoolTest);
  deployer.deploy(AddressTest);
};

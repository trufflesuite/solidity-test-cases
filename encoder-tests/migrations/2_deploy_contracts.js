var Linked = artifacts.require("Linked");
var EncoderTest = artifacts.require("EncoderTest");
var DecimalTest = artifacts.require("DecimalTest");

module.exports = function(deployer) {
  deployer.deploy(Linked);
  deployer.link(Linked, EncoderTest);
  deployer.deploy(EncoderTest, 2);
  deployer.deploy(DecimalTest);
};

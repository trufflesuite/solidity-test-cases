var EncoderTest = artifacts.require("EncoderTest");
var DecimalTest = artifacts.require("DecimalTest");

module.exports = function(deployer) {
  deployer.deploy(EncoderTest, 2);
  deployer.deploy(DecimalTest);
};

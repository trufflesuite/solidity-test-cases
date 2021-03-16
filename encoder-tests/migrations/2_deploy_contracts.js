var EncoderTest = artifacts.require("EncoderTest");

module.exports = function(deployer) {
  deployer.deploy(EncoderTest, 2);
};

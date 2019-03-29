var EmptyTest = artifacts.require("EmptyTest");
var Sink = artifacts.require("Sink");

module.exports = function(deployer) {
  deployer.deploy(EmptyTest);
  deployer.deploy(Sink);
};

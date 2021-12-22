var NonceTest = artifacts.require("NonceTest");
var Splib = artifacts.require("Splib");

module.exports = function(deployer) {
  deployer.deploy(Splib);
  deployer.link(Splib, NonceTest);
  deployer.deploy(NonceTest);
};

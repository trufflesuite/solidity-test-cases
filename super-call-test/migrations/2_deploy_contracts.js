var Derived = artifacts.require("Derived");
var DerivedEmitter = artifacts.require("DerivedEmitter");
var Z = artifacts.require("Z");
var K1 = artifacts.require("K1");
var K2 = artifacts.require("K2");
var K3 = artifacts.require("K3");

module.exports = function(deployer) {
  deployer.deploy(Derived);
  deployer.deploy(DerivedEmitter);
  deployer.deploy(Z);
  deployer.deploy(K1);
  deployer.deploy(K2);
  deployer.deploy(K3);
};

var CantCreate = artifacts.require("CantCreate");
var Tester = artifacts.require("Tester");
var NestedException = artifacts.require("NestedException");
var MakeAt = artifacts.require("MakeAt");

module.exports = function(deployer) {
  //deployer.deploy(CantCreate);
  deployer.deploy(Tester);
  deployer.deploy(NestedException);
  deployer.deploy(MakeAt);
};

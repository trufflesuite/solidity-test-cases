var CantCreate = artifacts.require("CantCreate");
var Tester = artifacts.require("Tester");
var NestedException = artifacts.require("NestedException");

module.exports = function(deployer) {
  //deployer.deploy(CantCreate);
  deployer.deploy(Tester);
  deployer.deploy(NestedException);
};

var CantCreate = artifacts.require("CantCreate");
var Tester = artifacts.require("Tester");

module.exports = function(deployer) {
  //deployer.deploy(CantCreate);
  deployer.deploy(Tester);
};

var Tester = artifacts.require("Tester");
var ThisTestLib = artifacts.require("ThisTestLib");

module.exports = function(deployer) {
  deployer.deploy(ThisTestLib);
  deployer.link(ThisTestLib, Tester);
  deployer.deploy(Tester);
};

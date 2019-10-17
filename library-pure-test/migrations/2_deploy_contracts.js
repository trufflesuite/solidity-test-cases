var HasPure = artifacts.require("HasPure");
var Tester = artifacts.require("Tester");

module.exports = function(deployer) {
  deployer.deploy(HasPure);
  deployer.link(HasPure, Tester);
  deployer.deploy(Tester);
};

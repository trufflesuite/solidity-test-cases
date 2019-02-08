var NoCodeTest = artifacts.require("NoCodeTest");
//var HasCodeTest = artifacts.require("HasCodeTest");

module.exports = function(deployer) {
  deployer.deploy(NoCodeTest);
//  deployer.deploy(HasCodeTest);
};

var Mappings = artifacts.require("Mappings");
var NoStruct = artifacts.require("NoStruct");

module.exports = function(deployer) {
  deployer.deploy(Mappings);
  deployer.deploy(NoStruct);
};

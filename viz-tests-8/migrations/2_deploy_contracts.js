var VizLibrary = artifacts.require("VizLibrary");
var VizTest = artifacts.require("VizTest");
var Secondary = artifacts.require("Secondary");

module.exports = function(deployer) {
  deployer.deploy(VizLibrary);
  deployer.link(VizLibrary, VizTest);
  deployer.deploy(VizTest, { value: 100 });
  deployer.deploy(Secondary, 39);
};

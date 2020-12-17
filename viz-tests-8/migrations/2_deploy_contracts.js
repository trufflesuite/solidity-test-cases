var Library = artifacts.require("Library");
var VizTest = artifacts.require("VizTest");
var Secondary = artifacts.require("Secondary");

module.exports = function(deployer) {
  deployer.deploy(Library);
  deployer.link(Library, VizTest);
  deployer.deploy(VizTest, { value: 100 });
  deployer.deploy(Secondary);
};

var Library = artifacts.require("Library");
var VizTest = artifacts.require("VizTest");

module.exports = function(deployer) {
  deployer.deploy(Library);
  deployer.link(Library, VizTest);
  deployer.deploy(VizTest, { value: 100 });
};

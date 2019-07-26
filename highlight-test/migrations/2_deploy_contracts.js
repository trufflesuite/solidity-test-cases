var HighlightTest = artifacts.require("HighlightTest");
var Demo = artifacts.require("Demo");

module.exports = function(deployer) {
  deployer.deploy(HighlightTest);
  deployer.deploy(Demo);
};

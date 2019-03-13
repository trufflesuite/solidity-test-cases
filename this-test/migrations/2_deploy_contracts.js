var Tester = artifacts.require("Tester");
var ThisTestLib = artifacts.require("ThisTestLib");
var MappingPointerTest = artifacts.require("MappingPointerTest");
var TouchLib = artifacts.require("TouchLib");

module.exports = function(deployer) {
  deployer.deploy(ThisTestLib);
  deployer.link(ThisTestLib, Tester);
  deployer.deploy(Tester);
  deployer.deploy(TouchLib);
  deployer.link(TouchLib, MappingPointerTest);
  deployer.deploy(MappingPointerTest);
};

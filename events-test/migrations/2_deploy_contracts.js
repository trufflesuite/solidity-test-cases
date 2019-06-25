var EventsTest = artifacts.require("EventsTest");
var EventOptionsTest = artifacts.require("EventOptionsTest");
var AnonTest = artifacts.require("AnonTest");
var EmitsForeign = artifacts.require("EmitsForeign");
var Emitter = artifacts.require("Emitter");
var EmitsLibraries = artifacts.require("EmitsLibraries");
var TheContract = artifacts.require("TheContract");
var Library1 = artifacts.require("Library1");
var Library2 = artifacts.require("Library2");
var MinimalFunctionTest = artifacts.require("MinimalFunctionTest");

module.exports = function(deployer) {
  deployer.deploy(EventsTest);
  deployer.deploy(EventOptionsTest);
  deployer.deploy(AnonTest, 3, 35);
  deployer.deploy(EmitsForeign);
  deployer.deploy(Emitter);
  deployer.link(Emitter, EmitsLibraries);
  deployer.deploy(EmitsLibraries);
  deployer.deploy(Library1);
  deployer.deploy(Library2);
  deployer.link(Library1, TheContract);
  deployer.link(Library2, TheContract);
  deployer.deploy(TheContract);
  deployer.deploy(MinimalFunctionTest);
};

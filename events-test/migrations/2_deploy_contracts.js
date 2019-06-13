var EventsTest = artifacts.require("EventsTest");
var EventOptionsTest = artifacts.require("EventOptionsTest");
var AnonTest = artifacts.require("AnonTest");
var EmitsForeign = artifacts.require("EmitsForeign");
var Emitter = artifacts.require("Emitter");
var EmitsLibraries = artifacts.require("EmitsLibraries");

module.exports = function(deployer) {
  deployer.deploy(EventsTest);
  deployer.deploy(EventOptionsTest);
  deployer.deploy(AnonTest, 3, 35);
  deployer.deploy(EmitsForeign);
  deployer.deploy(Emitter);
  deployer.link(Emitter, EmitsLibraries);
  deployer.deploy(EmitsLibraries);
};

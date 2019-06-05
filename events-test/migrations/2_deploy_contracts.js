var EventsTest = artifacts.require("EventsTest");
var EventOptionsTest = artifacts.require("EventOptionsTest");
var AnonTest = artifacts.require("AnonTest");

module.exports = function(deployer) {
  deployer.deploy(EventsTest);
  deployer.deploy(EventOptionsTest);
  deployer.deploy(AnonTest, 3, 35);
};

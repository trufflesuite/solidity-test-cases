var EventsTest = artifacts.require("EventsTest");
var EventOptionsTest = artifacts.require("EventOptionsTest");

module.exports = function(deployer) {
  deployer.deploy(EventsTest);
  deployer.deploy(EventOptionsTest);
};

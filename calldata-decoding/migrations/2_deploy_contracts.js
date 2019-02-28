var CalldataTest = artifacts.require("CalldataTest");
var CalldataLibrary = artifacts.require("CalldataLibrary");

module.exports = function(deployer) {
  deployer.deploy(CalldataLibrary);
  deployer.link(CalldataLibrary, CalldataTest);
  deployer.deploy(CalldataTest);
};

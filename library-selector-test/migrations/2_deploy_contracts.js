var WeirdTypesLib = artifacts.require("WeirdTypesLib");
var LibrarySelectorTest = artifacts.require("LibrarySelectorTest");

module.exports = function(deployer) {
  deployer.deploy(WeirdTypesLib);
  deployer.link(WeirdTypesLib, LibrarySelectorTest);
  deployer.deploy(LibrarySelectorTest);
};

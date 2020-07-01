var WeirdTypesLib = artifacts.require("WeirdTypesLib");
var LibrarySelectorTest = artifacts.require("LibrarySelectorTest");
var LibraryReturnTest = artifacts.require("LibraryReturnTest");

module.exports = function(deployer) {
  deployer.deploy(WeirdTypesLib);
  deployer.link(WeirdTypesLib, LibrarySelectorTest);
  deployer.deploy(LibrarySelectorTest);
  deployer.deploy(LibraryReturnTest);
};

var CalldataTest = artifacts.require("CalldataTest");
var InternalOnly = artifacts.require("InternalOnly");
//var CalldataTestV2 = artifacts.require("CalldataTestV2");

module.exports = function(deployer) {
  deployer.deploy(CalldataTest);
  deployer.deploy(InternalOnly);
//  deployer.deploy(CalldataTestV2);
};

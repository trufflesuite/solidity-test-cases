var NimProd = artifacts.require("NimProd");
var NimProdTester = artifacts.require("NimProdTester");

module.exports = function(deployer) {
  deployer.deploy(NimProd);
  deployer.deploy(NimProdTester);
};

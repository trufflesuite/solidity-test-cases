const Lib = artifacts.require("Lib");
const InternalsTest = artifacts.require("InternalsTest");

module.exports = function(deployer) {
  deployer.deploy(Lib);
  deployer.link(Lib, InternalsTest);
  deployer.deploy(InternalsTest);
};

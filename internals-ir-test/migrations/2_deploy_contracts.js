const Lib = artifacts.require("Lib");
const InternalsTest = artifacts.require("InternalsTest");
const InternalsTestBase = artifacts.require("InternalsTestBase");

module.exports = function(deployer) {
  deployer.deploy(Lib);
  deployer.link(Lib, InternalsTest);
  deployer.link(Lib, InternalsTestBase);
  deployer.deploy(InternalsTest);
  deployer.deploy(InternalsTestBase);
};

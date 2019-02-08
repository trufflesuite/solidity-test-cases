var AllocTest = artifacts.require("AllocTest");
var ComplexInheritanceTest = artifacts.require("ComplexInheritanceTest");

module.exports = function(deployer) {
  deployer.deploy(AllocTest);
  deployer.deploy(ComplexInheritanceTest);
};

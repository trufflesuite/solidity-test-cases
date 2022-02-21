var YulTest2 = artifacts.require("YulTest2");
var YulFnTest = artifacts.require("YulFnTest");

module.exports = function(deployer) {
  deployer.deploy(YulTest2);
  deployer.deploy(YulFnTest);
};

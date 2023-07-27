var YulTest2 = artifacts.require("YulTest2");
var YulFnTest = artifacts.require("YulFnTest");
var ComplicatedTest = artifacts.require("ComplicatedTest");

module.exports = function(deployer) {
  deployer.deploy(YulTest2);
  deployer.deploy(YulFnTest);
  deployer.deploy(ComplicatedTest);
};

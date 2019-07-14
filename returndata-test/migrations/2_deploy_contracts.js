var CreateReturnTest = artifacts.require("CreateReturnTest");
var Sink = artifacts.require("Sink");
var RevertFormatTest = artifacts.require("RevertFormatTest");
var Tester1 = artifacts.require("Tester1");
var Tester2 = artifacts.require("Tester2");
var Tester3 = artifacts.require("Tester3");
var Fail = artifacts.require("Fail");
var Return = artifacts.require("Return");

module.exports = function(deployer) {
  deployer.deploy(CreateReturnTest);
  deployer.deploy(Sink);
  deployer.deploy(RevertFormatTest);
  deployer.deploy(Tester1);
  deployer.deploy(Tester2);
  deployer.deploy(Tester3);
  deployer.deploy(Fail);
  deployer.deploy(Return);
};

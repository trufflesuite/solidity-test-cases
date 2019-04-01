var LongName = artifacts.require("ThisLibraryHasAReallyLongNameWayLongerThanTwiceAWordItWillBeAPainToTypeGoodThingTheresCopyAndPaste");
var Tester = artifacts.require("Tester");
var X = artifacts.require("X");

module.exports = function(deployer) {
  //deployer.deploy(LongName);
  //deployer.link(LongName, Tester);
  deployer.deploy(X);
  deployer.link(X, Tester);
  deployer.deploy(Tester);
};

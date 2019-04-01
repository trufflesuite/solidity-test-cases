var LongName = artifacts.require("ThisLibraryHasAReallyLongNameWayLongerThanTwiceAWordItWillBeAPainToTypeGoodThingTheresCopyAndPaste");
var Tester = artifacts.require("Tester");

module.exports = function(deployer) {
  deployer.deploy(LongName);
  deployer.link(LongName, Tester);
  deployer.deploy(Tester);
};

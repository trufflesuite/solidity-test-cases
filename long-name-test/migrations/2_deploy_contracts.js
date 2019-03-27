var LongName = artifacts.require("ThisLibraryHasAReallyLongNameWayLongerThanTwiceAWordItWillBeAPainToTypeGoodThingTheresCopyAndPaste");

module.exports = function(deployer) {
  deployer.deploy(LongName);
};

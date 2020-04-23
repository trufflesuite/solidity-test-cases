const util = require("util");
const StacktraceTest = artifacts.require("StacktraceTest");

contract("StacktraceTest", function(accounts) {
  it("fails! hahahaha", async function() {
    let instance = await StacktraceTest.deployed();
    await instance.run(2); //leaves a message
  });
  it("fails on deployment!", async function() {
    await StacktraceTest.new(false);
  });
});

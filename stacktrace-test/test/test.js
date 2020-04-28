const util = require("util");
const StacktraceTest = artifacts.require("StacktraceTest");

contract("StacktraceTest", function(accounts) {
  /*
  it("succeeds & prints txHash", async function() {
    let instance = await StacktraceTest.deployed();
    instance.run(12).on("transactionHash", console.log);
  });
  */
  it("fails! hahahaha", async function() {
    let instance = await StacktraceTest.deployed();
    await instance.run(2); //leaves a message
  });
  it("fails with extra info", async function() {
    let instance = await StacktraceTest.deployed();
    await instance.run(4); //leaves a message
  });
  it("fails on deployment!", async function() {
    await StacktraceTest.new(false);
  });
});

const util = require("util");
const StacktraceTest = artifacts.require("StacktraceTest");

contract("StacktraceTest", function(accounts) {
  it("succeeds", async function() {
    let instance = await StacktraceTest.deployed();
    await instance.run(12);
  });
  it("succeeds but fails anyway", async function() {
    let instance = await StacktraceTest.deployed();
    await instance.run(12);
    assert(false);
  });
  it("fails! hahahaha", async function() {
    let instance = await StacktraceTest.deployed();
    await instance.run(2); //leaves a message
  });
  it("fails with extra info", async function() {
    let instance = await StacktraceTest.deployed();
    await instance.run(4); //leaves a message
  });
  it("fails with panic", async function() {
    let instance = await StacktraceTest.deployed();
    await instance.run(11);
  });
  it("fails on deployment!", async function() {
    await StacktraceTest.new(2);
  });
  it("SDs on deployment!", async function() {
    await StacktraceTest.new(1);
  });
});

contract("StacktraceTest Part 2", function(accounts) {
  it("succeeds", async function() {
    let instance = await StacktraceTest.deployed();
    let deferred = instance.run(12);
    let receipt = await deferred;
  });
});

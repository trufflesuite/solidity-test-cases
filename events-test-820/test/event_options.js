const EventOptionsTest = artifacts.require("EventOptionsTest");

contract("EventOptionsTest", function () {
  it("test", async function () {
    const instance = await EventOptionsTest.deployed();
    await instance.run();
  });
});

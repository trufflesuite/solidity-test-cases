const ErrorError = artifacts.require("ErrorError");

contract("ErrorError", function () {
  it("should assert true", async function () {
    const it = await ErrorError.deployed();
    try {
      await it.utf8.call();
      assert.fail("The above call should revert!");
    } catch (e) {
      assert.include(e.message, "¡¡¡", "Message should contain correct decoding of UTF-8");
      assert.notInclude(e.message, "Â¡Â¡Â¡", "Message should not contain UTF-8 -> ISO-8859-1 mojibake");
    }
  });
});

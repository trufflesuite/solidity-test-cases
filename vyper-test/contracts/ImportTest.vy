import Imported as Test
import Imported2 as Test2

@external
def test(e: address):
    Test(e).test()

@external
def test2(e: address):
    Test2(e).test()

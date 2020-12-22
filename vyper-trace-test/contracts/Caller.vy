import TraceTest as Test

test: address

event Here: pass

@external
def run():
    log Here()
    Test(self.test).run0()
    log Here()

@external
def __init__(test: address):
    self.test = test

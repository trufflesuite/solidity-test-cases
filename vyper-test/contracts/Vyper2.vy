@external
def vyper_action() -> uint256:
    return self.balance + 1

@external
def __init__():
    pass

@external
def fail():
    raise "Mayday, mayday!"

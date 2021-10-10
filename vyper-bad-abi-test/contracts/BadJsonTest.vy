struct Pair:
    x: uint256
    y: uint256

event Stuff:
    pair: Pair
    z: uint256

pair: Pair

@external
def __init__(pair: Pair):
    self.pair = pair

@external
@pure
def identity(pair: Pair, z: uint256) -> (Pair, uint256):
     return (pair, z)

@external
@pure
def simpleIdentity(pair: Pair) -> Pair:
     return pair

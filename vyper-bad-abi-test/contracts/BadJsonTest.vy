struct Pair:
    x: uint256
    y: uint256

event Stuff:
    pair: Pair
    z: uint256

pair: Pair
z: uint256

@external
def __init__(pair: Pair, z: uint256):
    self.pair = pair
    self.z = z

@external
@pure
def identity(pair: Pair, z: uint256) -> (Pair, uint256):
     return (pair, z)

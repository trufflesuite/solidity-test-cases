struct Pair:
    x: uint256
    y: uint256

event Stuff:
    pair: Pair
    z: uint256

@external
@pure
def identity(pair: Pair, z: uint256) -> (Pair, uint256):
     return (pair, z)

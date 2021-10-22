struct Pair:
    x: uint256
    y: uint256

flag: bool
count: uint256
static: constant(uint256) = 3
difference: int128
bigDifference: int256
decimalValue: decimal
where: address
raw: bytes32
word: Bytes[64]
text: String[64]
list: uint256[3]
pair: Pair
multiList: Pair[3]
map: HashMap[uint256, uint256]
complexMap: HashMap[uint256, HashMap[uint256, uint256]]

@external
def doThings(what: bool, info: Pair) -> (int128, int128):
    x: uint256 = 3
    stuff: Pair = Pair({ x: 1, y: 2 })
    ints: uint256[3] = [4, 5, 6]
    for i in ints:
        self.map[i] = i
        self.complexMap[i][i] = i
    return (-1, -2)

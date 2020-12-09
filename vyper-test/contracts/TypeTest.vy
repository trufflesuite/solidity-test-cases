struct Pair:
    where: address
    whether: bool

#units: {
#  m: "meter"
#}

flag: bool
count: uint256
difference: int128
ratio: decimal
where: address
raw: bytes32
long: Bytes[64]
#long: bytes[64]
text: String[64]
#text: string[64]

list: uint256[3]
associator: HashMap[bytes32, address]
#associator: map(bytes32, address)

#current: timestamp
#duration: timedelta
#currency: wei_value

#length: decimal(m)

getme: public(uint256)
unmoving: constant(uint256) = 1
#pubconst: public(constant(uint256) #this is illegal
#constpub: constant(public(uint256) #so is this

pair: Pair

@external
def conjoin(a: bool, b: bool) -> bool:
    c: bool = a and b
    return c

@external
def combine(a: uint256, b: uint256) -> uint256:
    c: uint256 = a + b
    return c

@external
def settle(a: int128, b: int128) -> int128:
    c: int128 = a + b
    return c

@external
def pool(a: decimal, b: decimal) -> decimal:
    c: decimal = a + b
    return c

@external
def here(a: address) -> address:
    b: address = a
    return a

@external
def identity(a: bytes32) -> bytes32:
    b: bytes32 = a
    return b

@external
def preserve(a: Bytes[64]) -> Bytes[64]:
    b: Bytes[64] = a
    return b

@external
def translate(a: String[64]) -> String[64]:
    b: String[64] = a
    return b

@external
def reiterate(a: uint256[3]) -> uint256[3]:
    b: uint256[3] = a
    return b

@external
def keep_together(a: Pair) -> Pair:
    b: Pair = a
    return b

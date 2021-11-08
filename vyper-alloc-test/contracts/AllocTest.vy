event Here: pass

event Num:
    x: int128

event Unum:
    x: uint256

struct Pair:
    x: uint256
    y: uint256

struct StringPair:
    x: String[16]
    y: String[16]

@external
def __init__(n: int128, a: String[31], m: int128, b: String[31], k: int128, c: String[31]):
    log Here()

@internal
def alternateTest(n1: int128, s1: String[31], n2: int128, s2: String[31], n3: int128, s3: String[31]):
    log Here()

@external
def alternateTester():
    self.alternateTest(-1, "ABC", -16, "DEFG", -256, "HIJKL")

@internal
def stringTest(a: String[31], b: String[31], c: String[31]):
    x: String[31] = "MNOPQR"
    x = a
    log Here()

@external
def stringPairTest():
    p: StringPair = StringPair({ x: "Hello", y: "Hi" })
    log Here()

@external
def stringTester():
    self.stringTest("ABC", "DEFG", "HIJKL")

@internal
def consecTest(x: int128, s: String[10], y: int128, w: uint256[2], z: int128, v: Pair, zz: int128):
    log Here()

@external
def callConsecTest():
    x: int128 = -1
    s: String[10] = "0123456789"
    y: int128 = -16
    w: uint256[2] = [33, 34]
    z: int128 = -256
    v: Pair = Pair({ x: 49, y: 50 })
    zz: int128 = -4096
    self.consecTest(x, s, y, w, z, v, zz)

@external
def assignmentTest():
    x: uint256[2] = [33, 34]
    y: String[31] = "wub"
    z: uint256 = 80
    z2: uint256 = 25
    z = z2
    y2: String[31] = "AAA"
    y = y2
    x2: uint256[2] = [35, 36]
    x = x2
    log Here()

@internal
def nestTest3(x: int128, y: int128):
    log Num(x * 16)
    log Num(y * 16)

@internal
def nestTest2(x: int128, y: int128):
    self.nestTest3(x * 16, y * 16)

@internal
def nestTest1(x: int128, y: int128):
    self.nestTest2(x * 16, y * 16)

@external
def nestTest():
    self.nestTest1(-1, -16)

#this function doesn't work on some old 0.2.x versions
@internal
def blockTest():
    a: uint256 = 7
    b: int128 = 21
    for i in range(3):
        log Unum(i) #works
        #log Num(i) #ALSO WORKS (but not together)
    for i in range(1, 3):
        #log Unum(i) #ALSO WORKS (but not together)
        log Num(i) #works
    for i in range(-1, 3):
        #log Unum(i) #fails
        log Num(i) #works
    for i in range(170141183460469231731687303715884105727, 170141183460469231731687303715884105728):
        log Unum(i) #works
        #log Num(i) #fails
    for i in range(a, a + 3):
        log Unum(i) #works
        #log Num(i) #fails
    for i in range(b, b + 2):
        #log Unum(i) #fails
        log Num(i) #works

@external
def run():
    a: uint256[2] = [17, 18]
    b: Pair = Pair({ x: 19, y: 20 })
    c: String[100] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    log Here()

@external
def doStuff(z: String[100], a: uint256[2], b: Pair, c: String[100]):
    log Here()

@external
def takeStrings(a: String[31], b: String[32], c: String[33], d: String[34]):
    log Here()

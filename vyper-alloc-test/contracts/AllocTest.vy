event Here: pass

event Num:
    x: int128

event Unum:
    x: uint256

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

struct Pair:
    x: uint256
    y: uint256

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

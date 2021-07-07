event Here: pass

struct Pair:
    x: int128
    y: int128

struct ArrPair:
    x: int128[2]
    y: int128[2]

struct PairPair:
    x: Pair
    y: Pair

struct StrPair:
    x: String[16]
    y: String[16]

bar0: int128
arr: int128[2]
bar1: int128
obj: Pair
bar2: int128
arrarr: int128[2][2]
bar3: int128
objobj: PairPair
bar4: int128
objarr: Pair[2]
bar5: int128
arrobj: ArrPair
bar6: int128
str: String[80]
bar7: int128
strobj: StrPair
bar8: int128
map: HashMap[uint256, int128]
bar9: int128
strmap: HashMap[uint256, String[16]]
bar10: int128
arrmap: HashMap[uint256, int128[2]]
bar11: int128

@external
def run():
    self.bar0 = -1
    self.arr[0] = 1
    self.arr[1] = 2
    self.bar1 = -1
    self.obj.x = 1
    self.obj.y = 2
    self.bar2 = -1
    self.arrarr[0][0] = 1
    self.arrarr[0][1] = 2
    self.arrarr[1][0] = 3
    self.arrarr[1][1] = 4
    self.bar3 = -1
    self.objobj.x.x = 1
    self.objobj.x.y = 2
    self.objobj.y.x = 3
    self.objobj.y.y = 4
    self.bar4 = -1
    self.objarr[0].x = 1
    self.objarr[0].y = 2
    self.objarr[1].x = 3
    self.objarr[1].y = 4
    self.bar5 = -1
    self.arrobj.x[0] = 1
    self.arrobj.x[1] = 2
    self.arrobj.y[0] = 3
    self.arrobj.y[1] = 4
    self.bar6 = -1
    self.str = "Hi there, this is a string!"
    self.bar7 = -1
    self.strobj.x = "abc"
    self.strobj.y = "xyz"
    self.bar8 = -1
    self.map[1] = 1
    self.bar9 = -1
    self.strmap[1] = "mapped string"
    self.bar10 = -1
    self.arrmap[1][0] = 1
    self.arrmap[1][1] = 2
    self.bar11 = -1

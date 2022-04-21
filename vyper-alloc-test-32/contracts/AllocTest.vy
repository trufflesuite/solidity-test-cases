event Here: pass

bar0: int128
arr: DynArray[uint256, 3]
bar1: int128
str: String[16]
bar2: int128

@external
def run():
    self.bar0 = -1
    self.arr.append(1)
    self.arr.append(2)
    self.arr.append(3)
    self.bar1 = -1
    self.str = "Hello world!"
    self.bar2 = -1
    log Here()

arr: DynArray[uint256[2], 3]
interfere: uint256

@external
def run() -> uint256:
    self.arr.append([1, 2])
    self.arr.append([3, 4])
    self.arr.append([5, 6])
    self.interfere = 7
    return self.arr[2][1]

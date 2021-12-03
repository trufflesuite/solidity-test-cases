event Num:
    num: uint256

imm: immutable(uint256)

@external
def __init__(x: uint256):
    imm = x

@external
def report():
    log Num(imm)

event Num:
    num: int128

imm: immutable(int128)

@external
def __init__(x: int128):
    imm = x

@external
def report():
    log Num(imm)

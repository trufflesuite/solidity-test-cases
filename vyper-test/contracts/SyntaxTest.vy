event Here: pass

@external
def sgn(x: int128) -> int128:
    if x > 0:
        return 1
    elif x < 0:
        return -1
    else:
        return 0

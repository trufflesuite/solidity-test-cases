struct Pair:
    str: String[16]
    raw: Bytes[16]

event Text:
    str: String[16]

event Binary:
    raw: Bytes[16]

event Both:
    pair: Pair

event DoublePair:
    pair1: Pair
    pair2: Pair

@external
@pure
def returnsString() -> String[16]:
    return "Hello"

@external
@pure
def returnsBytes() -> Bytes[16]:
    return 0xdeadbeef

@external
@pure
def returnsPair() -> Pair:
    return Pair({ str: "Hello", raw: 0xdeadbeef })

@external
def takesString(input: String[16]) -> String[16]:
    copy: String[16] = input
    log Text(copy)
    return copy

@external
def takesBytes(input: Bytes[16]) -> Bytes[16]:
    copy: Bytes[16] = input
    log Binary(copy)
    return copy

#@external
#def takesPair(input: Pair) -> Pair:
#    copy: Pair = input
#    log Both(copy)
#    return copy

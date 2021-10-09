from . import BadAbiTest

struct Pair:
    str: String[16]
    raw: Bytes[16]

event Text:
    str: String[16]

event Binary:
    raw: Bytes[16]

event Both:
    pair: Pair

target: address

@external
def __init__(target: address):
    self.target = target

@external
def passesString() -> String[16]:
    returned: String[16] = BadAbiTest(self.target).takesString("hello")
    log Text(returned)
    return returned

@external
def passesBytes() -> Bytes[16]:
    returned: Bytes[16] = BadAbiTest(self.target).takesBytes(0xdeadbeef)
    log Binary(returned)
    return returned

#@external
#def passesPair() -> Pair:
#    returned: Pair = BadAbiTest(self.target).takesPair({ str: "hello", raw: 0xdeadbeef })
#    log Both(returned)
#    return returned

@external
def receivesString() -> String[16]:
    returned: String[16] = BadAbiTest(self.target).returnsString()
    log Text(returned)
    return returned

@external
def receivesBytes() -> Bytes[16]:
    returned: Bytes[16] = BadAbiTest(self.target).returnsBytes()
    log Binary(returned)
    return returned

@external
def receivesPair() -> Pair:
    returned: Pair = BadAbiTest(self.target).returnsPair()
    log Both(returned)
    return returned

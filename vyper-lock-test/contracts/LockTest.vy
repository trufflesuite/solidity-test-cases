event Here: pass
event Barrier:
    barrier: int128

barrier: int128

@external
def __init__():
    self.barrier = -1

@external
@nonreentrant("abc")
def lock1():
    log Barrier(self.barrier)
    log Here()

@external
@nonreentrant("def")
def lock2():
    log Barrier(self.barrier)
    log Here()

@internal
@nonreentrant("123")
def called():
    log Here()

@external
@nonreentrant("hello")
def lock3():
    log Barrier(self.barrier)
    self.called()

@external
@nonreentrant("abc")
def lock4():
    log Barrier(self.barrier)
    log Here()

@external
def nolock():
    log Barrier(self.barrier)
    log Here()

@external
@nonreentrant("potato")
def lock5():
    log Barrier(self.barrier)
    log Here()

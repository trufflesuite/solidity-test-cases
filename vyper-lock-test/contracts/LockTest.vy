event Here: pass

@external
@nonreentrant("abc")
def lock1():
    log Here()

@external
@nonreentrant("def")
def lock2():
    log Here()

@internal
@nonreentrant("123")
def called():
    log Here()

@external
@nonreentrant("hello")
def lock3():
    self.called()

@external
@nonreentrant("abc")
def lock4():
    log Here()

@external
def nolock():
    log Here()

@external
@nonreentrant("potato")
def lock5():
    log Here()

event Here: pass

@internal
def run2():
    log Here()
    raise "Mayday, mayday!"

@internal
def run1():
    log Here()
    self.run2()
    log Here()

@external
def run0():
    log Here()
    self.run1()
    log Here()

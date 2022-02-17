//SPDX-License-Identifier: MIT

object "YulImmutables" {
  code {
    let size := datasize("runtime")
    let offset := dataoffset("runtime")
    setimmutable(offset, "secret", 1)
    datacopy(0, offset, size)
    return(0, size)
  }
  object "runtime" {
    code {
      mstore(0, loadimmutable("secret"))
      return(0, 0x20)
    }
  }
}

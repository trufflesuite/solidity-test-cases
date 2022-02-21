//SPDX-License-Identifier: MIT

object "YulFnTest" {
  code {
    let size := datasize("runtime")
    datacopy(0, dataoffset("runtime"), size)
    return(0, size)
  }
  object "runtime" {
    code {
      function one() -> a {
        a := 1
      }
      mstore(0, one())
      return(0, 0x20)
    }
  }
}

//SPDX-License-Identifier: MIT

object "DataTest" {
  code {
    let size1 := datasize("runtime")
    datacopy(0, dataoffset("runtime"), size1)
    let size2 := datasize("garbage")
    datacopy(size1, dataoffset("garbage"), size2)
    return(0, add(size1, size2))
  }
  data "garbage" "This is some extra garbage data!"
  object "runtime" {
    code {
      mstore(0, 1)
      return(0, 0x20)
    }
  }
}

//SPDX-License-Identifier: MIT

object "YulTest" {
  code {
    let size := datasize("runtime")
    datacopy(0, dataoffset("runtime"), size)
    return(0, size)
  }
  object "runtime" {
    code {
      mstore(0, linkersymbol("TestLibrary.sol:TestLibrary"))
      return(0, 0x20)
    }
  }
}

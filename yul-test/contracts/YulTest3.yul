//SPDX-License-Identifier: MIT

object "YulTest3" {
  code {
    let size := datasize("runtime")
    datacopy(0, dataoffset("runtime"), size)
    return(0, size)
  }
  object "runtime" {
    code {
      stop()
    }
  }
}


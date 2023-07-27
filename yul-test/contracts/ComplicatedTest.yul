//SPDX-License-Identifier: MIT

object "ComplicatedTest" {
  code {
    let size := datasize("runtime")
    datacopy(0, dataoffset("runtime"), size)
    return(0, size)
  }
  object "runtime" {
    code {
      function noop(nothing) -> void {
      }
      let u
      u := 128
      let v
      v := 256
      pop(noop(u))
      let s, t
      s := 80
      t := 88
      let x := 1
      { 
        let y := 0x2
        let j := y
        let p := add(y, 1)
        //let q := woozle
        y := add(y,1)
      }
      //let n, m := 90, 91
      //let n, m := (90, 91)
      for { let i := 3 x := "\xff" } lt(i, 5) { i := add(i, 1) } {
        log1(0, 0, i)
      }
      function complex(a, b) -> c, d {
        let problem, another
        let more, ohno
        problem := mul(a, b)
        another := xor(a, b)
        more := and(a,b)
        ohno := or(a,b)
        c := add(a,b)
        d := sub(a,b)
      }
      function simple(a) -> b {
        {
          let whatever
        }
        let gargparg
        b := not(a)
      }
      function simple2(a) -> b {
        {
          let prelim
          let yousee
        }
        {
          let whatever
          {
            let whoknows
          }
          let soogwoog
          b := not(a)
        }
        b := add(b, 1)
      }
      let z, w := complex(7, 9)
      let k := simple(9)
      k := simple2(add(3,4))
      z, w := complex(12, 20)
      let woozle := address()
      pop(woozle) //don't actually selfdestruct
    }
  }
}

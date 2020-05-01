pragma solidity ^0.6.0;

contract ScopesTest {

  uint constant fix = 9;
  uint constant fix2 = 3 + 4;

  function run() public {
    uint woozle = 70;
    assembly {
      function noop() {
      }
      let u
      let v
      noop()
      let s
      let t
      let x := 1
      { 
        let y := 2
        let j := y
        let p := add(y, 1)
        let q := woozle
	y := add(y,1)
      }
      //let n, m := 90, 91
      //let n, m := (90, 91)
      for { let i := 3 x := 40 } lt(i, 5) { i := add(i, 1) } {
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
	//woozle := mul(c,d) //compile error!
	//x := mul(c,d) //compile error!
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
      //function short(a) -> b b := not(a) //compile error!
      let z, w := complex(7, 9)
      let k := simple(fix)
      k := simple2(fix2)
      z, w := complex(12, 20)
      woozle := address()
      stop()
      selfdestruct(woozle) //don't actually selfdestruct
      //selfdestruct(complex) //compile error!
      //let fn := complex
      //selfdestruct(run)
      //let fn := run
      //run()
    }
  }
}

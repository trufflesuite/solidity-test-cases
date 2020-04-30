pragma solidity ^0.6.0;

contract ScopesTest {
  function doNothing() public {
    uint woozle;
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
	y := add(y,1)
      }
      for { let i := 3 x := 40 } lt(i, 5) { i := add(i, 1) } {
        log1(0, 0, i)
      }
      function complex(a, b) -> c, d {
        let problem
        c := add(a,b)
        d := sub(a,b)
	//woozle := mul(c,d) //compile error!
	//x := mul(c,d) //compile error!
      }
      //function short(a) -> b b := not(a) //compile error!
      let z, w := complex(7, 8)
      woozle := address()
      stop()
      selfdestruct(woozle) //don't actually selfdestruct
    }
  }
}

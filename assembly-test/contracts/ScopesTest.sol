contract ScopesTest {
  function doNothing() public {
    uint woozle;
    assembly {
      function noop() {
      }
      noop()
      let x := 1
      { 
        let y := 2
      }
      for { let i := 3 } lt(i, 5) { i := add(i, 1) } {
        log1(0, 0, i)
      }
      function complex(a, b) -> c, d {
        c := add(a,b)
        d := sub(a,b)
      }
      let z, w := complex(7, 8)
      woozle := address()
      stop()
      selfdestruct(woozle) //don't actually selfdestruct
    }
  }
}

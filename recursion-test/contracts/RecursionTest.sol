pragma solidity >=0.7.0;

contract RecursionTest {

  int lastResult;

  function factorial(int n) public returns(int nbang) {
    int prev;
    int prevFac;
    nbang = n;
    prev = n - 1; //break here #1 (12)
    if (n > 0) {
      prevFac = factorial(n - 1);
      nbang = n * prevFac;
    } else {
      nbang = 1;
    }
    lastResult = nbang; //break here #2 (22)
  }
}

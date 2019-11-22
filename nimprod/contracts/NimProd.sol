pragma solidity ^0.5.10;

contract NimProd {
  event Result(uint);

  function nimprod(uint n1, uint n2) public pure returns (uint) {
    uint total = 0;
    for(uint i1 = 0; n1 >> i1 != 0; i1++) {
      uint bit1 = 1 << i1;
      for(uint i2 = 0; n2 >> i2 != 0; i2++) {
        uint bit2 = 1 << i2;
        if(n1 & bit1 != 0 && n2 & bit2 != 0) {
          uint disjoint = i1 ^ i2;
          uint shared = i1 & i2;
          uint product = 1 << disjoint;
          for(uint bit = 1; bit <= shared && bit != 0; bit <<= 1) {
            if(bit & shared != 0) {
              uint fermat = 1 << bit;
              uint factor = fermat | (fermat >> 1);
              product = nimprod(product, factor);
            }
          }
          total ^= product;
        }
      }
    }
    return total;
  }

  function emitNimprod(uint n1, uint n2) public {
    emit Result(nimprod(n1, n2));
  }
}

pragma solidity ^0.5.10;

import "../contracts/NimProd.sol";

contract NimProdTester is NimProd {

  event success();
  event failure(uint n1, uint n2, uint product);

  function test() public {
    uint[0x10][0x10] memory products = [ [ uint
      (0x0),0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0], [uint
      (0x0),0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xA, 0xB, 0xC, 0xD, 0xE, 0xF], [uint
      (0x0),0x2, 0x3, 0x1, 0x8, 0xA, 0xB, 0x9, 0xC, 0xE, 0xF, 0xD, 0x4, 0x6, 0x7, 0x5], [uint
      (0x0),0x3, 0x1, 0x2, 0xC, 0xF, 0xD, 0xE, 0x4, 0x7, 0x5, 0x6, 0x8, 0xB, 0x9, 0xA], [uint
      (0x0),0x4, 0x8, 0xC, 0x6, 0x2, 0xE, 0xA, 0xB, 0xF, 0x3, 0x7, 0xD, 0x9, 0x5, 0x1], [uint
      (0x0),0x5, 0xA, 0xF, 0x2, 0x7, 0x8, 0xD, 0x3, 0x6, 0x9, 0xC, 0x1, 0x4, 0xB, 0xE], [uint
      (0x0),0x6, 0xB, 0xD, 0xE, 0x8, 0x5, 0x3, 0x7, 0x1, 0xC, 0xA, 0x9, 0xF, 0x2, 0x4], [uint
      (0x0),0x7, 0x9, 0xE, 0xA, 0xD, 0x3, 0x4, 0xF, 0x8, 0x6, 0x1, 0x5, 0x2, 0xC, 0xB], [uint
      (0x0),0x8, 0xC, 0x4, 0xB, 0x3, 0x7, 0xF, 0xD, 0x5, 0x1, 0x9, 0x6, 0xE, 0xA, 0x2], [uint
      (0x0),0x9, 0xE, 0x7, 0xF, 0x6, 0x1, 0x8, 0x5, 0xC, 0xB, 0x2, 0xA, 0x3, 0x4, 0xD], [uint
      (0x0),0xA, 0xF, 0x5, 0x3, 0x9, 0xC, 0x6, 0x1, 0xB, 0xE, 0x4, 0x2, 0x8, 0xD, 0x7], [uint
      (0x0),0xB, 0xD, 0x6, 0x7, 0xC, 0xA, 0x1, 0x9, 0x2, 0x4, 0xF, 0xE, 0x5, 0x3, 0x8], [uint
      (0x0),0xC, 0x4, 0x8, 0xD, 0x1, 0x9, 0x5, 0x6, 0xA, 0x2, 0xE, 0xB, 0x7, 0xF, 0x3], [uint
      (0x0),0xD, 0x6, 0xB, 0x9, 0x4, 0xF, 0x2, 0xE, 0x3, 0x8, 0x5, 0x7, 0xA, 0x1, 0xC], [uint
      (0x0),0xE, 0x7, 0x9, 0x5, 0xB, 0x2, 0xC, 0xA, 0x4, 0xD, 0x3, 0xF, 0x1, 0x8, 0x6], [uint
      (0x0),0xF, 0x5, 0xA, 0x1, 0xE, 0x4, 0xB, 0x2, 0xD, 0x7, 0x8, 0x3, 0xC, 0x6, 0x9]
    ];
    for(uint n1 = 0; n1 < 0x10; n1++) {
      for(uint n2 = n1; n2 < 0x10; n2++) {
        uint product = nimprod(n1, n2);
        if(product != products[n1][n2]) {
          emit failure(n1, n2, product);
          revert("Incorrect product!");
        }
      }
    }
    emit success();
  }
}

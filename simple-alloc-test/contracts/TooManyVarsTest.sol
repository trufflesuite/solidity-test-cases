pragma solidity ^0.5.0;

contract TooManyVarsTest {

  function run() public {
    uint var1 = 1;
    uint var2 = 2;
    uint var3 = 3;
    uint var4 = 4;
    uint var5 = 5;
    uint var6 = 6;
    uint var7 = 7;
    uint var8 = 8;
    uint var9 = 9;
    uint var10 = 10;
    uint var11 = 11;
    uint var12 = 12;
    uint var13 = 13;
    uint var14 = 14;
    uint var15 = 15;
    uint var16 = 16;
    uint var17 = 17;
    //var1 = 18; compile error!
  }

}

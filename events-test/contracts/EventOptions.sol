pragma solidity ^0.5.9;

contract EventOptionsTest {
  event MixedNames(uint, uint named, uint, uint AlsoNamed);

  event SomeDynamic(uint[2] staticArray, string dynamicString);

  event HasIndexed(uint data, uint indexed topic);

  event IndexedString(string indexed indecipherable);

  event NoName(int indexed topic, int[2] whatAreThese) anonymous;

  event DataOnly(int[2] whatAreThese) anonymous;

  event IndexedArray(uint[2] indexed indecipherable);

  event IndexedLength1Array(uint[1] indexed indecipherable);

  event IndexedDynamicArray(uint[] indexed indecipherable);

  event IndexedBytes(bytes indexed indecipherable);

  function run() public {
    emit MixedNames(5, 6, 7, 8);

    emit SomeDynamic([uint(43), 44], "dynaaaamic!");

    emit HasIndexed(88, 99);

    emit IndexedString("you can't read this!");

    emit NoName(-1, [int(-1), -1]);

    emit DataOnly([int(-1), -1]);

    //emit IndexedArray([uint(3), 5]);

    emit IndexedLength1Array([uint(17)]);

    emit IndexedBytes(hex"deadbeef");

    /*
    uint[] memory length1 = new uint[](1);
    uint[] memory length2 = new uint[](2);
    length1[0] = 7;
    length2[0] = 7;
    length2[1] = 8;

    emit IndexedDynamicArray(length1);

    emit IndexedDynamicArray(length2);
    */
  }
}

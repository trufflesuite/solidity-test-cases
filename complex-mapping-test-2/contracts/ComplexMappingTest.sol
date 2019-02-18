pragma solidity ^0.5.3;

contract ComplexMappingTest {

  event Done();

  struct MappingStruct {
    mapping(string => string) map0;
    mapping(string => string) map1;
  }

  struct ComplexStruct {
    mapping(string => mapping(string => string)[2])[] array0;
    mapping(string => mapping(string => string)[2])[] array1;
    mapping(string => mapping(string => string)[2])[] array2;
  }

  //first, the simpler cases
  mapping(string => string)[2] mapArrayStatic;
  mapping(string => string)[] mapArrayDynamic;
  mapping(string => mapping(string => string)) mapMap;
  MappingStruct mapStruct0;
  MappingStruct mapStruct1;

  //now, a complex case
  ComplexStruct complexStruct;

  function run() public {

    //test #1: do we correctly keep track in the simple cases?
    mapArrayStatic[0]["a"] = "0a";
    mapArrayStatic[0]["b"] = "0b";
    mapArrayStatic[1]["c"] = "1c";
    mapArrayStatic[1]["d"] = "1d";

    mapArrayDynamic.length = 2;
    mapArrayDynamic[0]["a"] = "0a";
    mapArrayDynamic[0]["b"] = "0b";
    mapArrayDynamic[1]["c"] = "1c";
    mapArrayDynamic[1]["d"] = "1d";

    mapMap["a"]["c"] = "ac";
    mapMap["a"]["d"] = "ad";
    mapMap["b"]["e"] = "be";
    mapMap["b"]["f"] = "bf";

    mapStruct0.map0["a"] = "00a";
    mapStruct0.map0["b"] = "00b";
    mapStruct0.map1["c"] = "01c";
    mapStruct0.map1["d"] = "01d";

    mapStruct1.map0["e"] = "10e";
    mapStruct1.map0["f"] = "10f";
    mapStruct1.map1["g"] = "11g";
    mapStruct1.map1["h"] = "11h";

    //test #2: do we correctly keep track in the complex case?
    complexStruct.array0.length = 1;
    complexStruct.array0[0]["a"][0]["b"] = "00a0b";

    //test #3: do we correctly keep track when simple pointers are involved?
    mapping(string => string) storage pointerToStatic = mapArrayStatic[0];
    pointerToStatic["e"] = "0e";

    mapping(string => string) storage pointerToDynamic = mapArrayDynamic[0];
    pointerToDynamic["e"] = "0e";

    mapping(string => string) storage pointerToMap1 = mapMap["a"];
    pointerToMap1["h"] = "ah";

    mapping(string => string) storage pointerToMap2 = mapMap["g"];
    pointerToMap2["i"] = "gi";

    mapping(string => string) storage pointerToStruct = mapStruct0.map0;
    pointerToStruct["i"] = "00i";

    //test #4: do we correctly keep track when complex pointers are involved?
    mapping(string => mapping(string => string)[2])[] storage complexArrayPointerOuter =
      complexStruct.array0;
    complexArrayPointerOuter[0]["c"][0]["d"] = "00c0d";
    mapping(string => mapping(string => string)[2]) storage complexMappingPointerOuter =
      complexArrayPointerOuter[0];
    complexMappingPointerOuter["e"][0]["f"] = "00e0f";
    mapping(string => string)[2] storage complexArrayPointerInner =
      complexMappingPointerOuter["g"];
    complexArrayPointerInner[0]["h"] = "00g0h";
    mapping(string => string) storage complexMappingPointerInner =
      complexArrayPointerInner[0];
    complexMappingPointerInner["i"] = "00g0i";

    //test #5: are overlapping paths handled correctly (upper first)?
    complexStruct.array1.length = 1;
    mapping(string => string) storage dummyPointer1 = complexStruct.array1[0]["j"][0];
    mapping(string => mapping(string => string)[2])[] storage entryPoint1 =
      complexStruct.array1;
    entryPoint1[0]["j"][0]["k"] = "10j0k";

    //test #6: are overlapping paths handled correctly (lower first)?
    complexStruct.array2.length = 1;
    mapping(string => mapping(string => string)[2])[] storage entryPoint2 =
      complexStruct.array2;
    entryPoint2[0]["l"][0]["m"] = "20l0m";
    mapping(string => string) storage dummyPointer2 = complexStruct.array1[0]["l"][0];

    //that's it!
    emit Done();
  }
}

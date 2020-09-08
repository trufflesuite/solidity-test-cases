//SPDX-License-Identifier: MIT
pragma solidity 0.5.10;

contract StructMappingTest {
  struct HasMapping {
    mapping(string => string) theMap;
  }
  HasMapping hasMapping;
  mapping(string => string)[] manyMaps;
  function run() public {
    //hasMapping.theMap["hello"] = "world";
    manyMaps.length = 1;
    manyMaps[0]["foo"] = "bar";
  }
}

contract EmptyStructTest {
  struct EmptyStruct {
    mapping(string => string) theMap;
  }
  function run() public {
    int[1] memory preBarrier;
    preBarrier[0] = -1;
    EmptyStruct[3] memory whoKnows;
    int[1] memory postBarrier;
    postBarrier[0] = -1;
  }
}

contract SAMTest {

  event Done();

  struct M {
    int preBarrier;
    mapping(string => string) theMap;
    int postBarrier;
  }

  function mtest() public {
    M memory m;
    m.preBarrier = -1;
    m.postBarrier = -1;
    emit Done();
  }

  struct AM {
    int preBarrier;
    mapping(string => string)[2] theMap;
    int postBarrier;
  }

  function amtest() public {
    AM memory am;
    am.preBarrier = -1;
    am.postBarrier = -1;
    emit Done();
  }

  struct AAM {
    int preBarrier;
    mapping(string => string)[2][2] theMap;
    int postBarrier;
  }

  function aamtest() public {
    AAM memory aam;
    aam.preBarrier = -1;
    aam.postBarrier = -1;
    emit Done();
  }

  struct DM {
    int preBarrier;
    mapping(string => string)[] theMap;
    int postBarrier;
  }

  function dmtest() public {
    DM memory dm;
    dm.preBarrier = -1;
    dm.postBarrier = -1;
    //dm.theMap = new mapping(string => string)[](2); //nope
    emit Done();
  }

  struct DDM {
    int preBarrier;
    mapping(string => string)[][] theMap;
    int postBarrier;
  }

  function ddmtest() public {
    DDM memory ddm;
    ddm.preBarrier = -1;
    ddm.postBarrier = -1;
    //ddm.theMap = new mapping(string => string)[][](2); //nope
    emit Done();
  }

  struct ADM {
    int preBarrier;
    mapping(string => string)[][2] theMap;
    int postBarrier;
  }

  function admtest() public {
    ADM memory adm;
    adm.preBarrier = -1;
    adm.postBarrier = -1;
    emit Done();
  }

  struct DAM {
    int preBarrier;
    mapping(string => string)[2][] theMap;
    int postBarrier;
  }

  function damtest() public {
    DAM memory dam;
    dam.preBarrier = -1;
    dam.postBarrier = -1;
    //dam.theMap = new mapping(string => string)[2][](2); //nope
    emit Done();
  }
}

pragma solidity ^0.5.5;
pragma experimental ABIEncoderV2;

contract AllocTest {

  event Done();

  event Received(bytes, bytes4);

  /*
  struct Empty {
  }
  */

  /*
  enum Empty {
  }
  */

  struct SemiDynamic {
    uint head;
    uint[] tail;
  }

  enum Ternary {
    yes, no, maybeSo
  }

  struct Pair {
    uint x;
    uint y;
  }

  struct ContainsMapping {
    uint x;
    mapping(uint => uint) map;
    uint y;
  }

  struct MappingsOnly {
    mapping(uint => uint) map1;
    mapping(uint => uint) map2;
  }

  struct Tree {
    uint x;
    Tree[] children;
  }

  struct MappingTree {
    uint x;
    mapping(string => MappingTree) children;
  }

  uint public w0;
  uint16[2] w1b0b3;
  uint16[2] w1b4b7;
  uint w2;
  uint16[2] w3b0b3;
  uint16[2] w3b4b7;
  uint preBarrierIntf;
  function (uint8) internal intf;
  int8 postBarrierIntf;
  uint preBarrierExtf;
  int8 preBarrierExtf2;
  function (uint8) external extf;
  int8 postBarrierExtf;
  uint preBarrierAgain;
  int224 letsBreakThings;
  function (uint8) external unbreakable;
  /*
  uint preZeroBarrier;
  uint8 preMarker;
  uint8[0] nullStorage;
  Empty nullStruct;
  uint8 postMarker;
  */
  int preMappingBarrier;
  mapping(uint => bytes4) map;
  function () external payable payHere1;
  int payBarrier;
  function () external payable payHere2;
  mapping(uint => function (uint8) internal) funcMapping;
  Tree tree;
  MappingTree mappingTree;

  function stackTest(int8 x, int8 y, int8 z) public returns (int8 a, int8 b, int8 c)
  {
    int8 w;
    w = -16;
    a = x + w;
    b = y + w;
    c = z + w;
    emit Done();
  }

  function frameTest(uint8 n) public
  {
    if(n>0) frameTest(n-1);
  }

  function storagePointerTest() public
  {
    uint16[2] storage sw1b0b3 = w1b0b3;
    uint16[2] storage sw1b4b7 = w1b4b7;
    uint16[2] storage sw3b0b3 = w3b0b3;
    uint16[2] storage sw3b4b7 = w3b4b7;

    sw1b0b3[0] = 37;
    sw1b0b3[1] = 38;
    sw1b4b7[0] = 39;
    sw1b4b7[1] = 40;
    sw3b0b3[0] = 41;
    sw3b0b3[1] = 42;
    sw3b4b7[0] = 43;
    sw3b4b7[1] = 44;
  }

  function stackBytesTest() public returns (bytes3 result)
  {
    result = 0xabcdef;
    emit Done();
  }

  function stackBoolTest() public returns (bool result)
  {
    result = true;
    emit Done();
  }

  function memoryBytesTest() public
  {
    bytes3[2] memory sixBytes;
    sixBytes[0] = 0x123456;
    sixBytes[1] = 0xabcdef;
    emit Done();
  }

  function internalTest() internal returns (function (uint8) internal result)
  {
    result = frameTest;
    intf = result;
    postBarrierIntf = -1;
    emit Done();
  }

  function internalTester() public
  {
    internalTest();
  }

  function externalTest() public returns (function (uint8) external result, bytes3 dummy, bytes4 sel, address addr)
  {
    function (uint8) external[2] memory sillyArray;
    result = this.frameTest;
    dummy = 0xabcdef;
    sel = result.selector;
    addr = address(this);
    extf = result;
    postBarrierExtf = -1;
    preBarrierExtf2 = -1;
    sillyArray[0] = result;
    sillyArray[1] = result;
    letsBreakThings = -1;
    unbreakable = result;
    emit Done();
  }

  function externalCalldataTest(function (uint8) external input, uint8 inDummy) external returns (function (uint8) external result, uint8 outDummy)
  {
    result = input;
    outDummy = inDummy;
    emit Done();
  }

  function externalCalldataTester() public
  {
    this.externalCalldataTest(this.frameTest, 254);
  }

  function memoryPointerTest(uint8[2] memory sillyArray) public
  {
    sillyArray[0] = 33;
    sillyArray[1] = 35;
    emit Done();
  }

  function memoryPointerTester() public
  {
    uint8[2] memory sillyArray;
    memoryPointerTest(sillyArray);
  }

  function dynamicMemoryTest() public
  {
    uint[] memory firstArray;
    uint[2] memory secondArray;
    secondArray[0] = 33;
    secondArray[1] = 35;
    firstArray = new uint[](3);
    firstArray[0] = 17;
    firstArray[1] = 18;
    firstArray[2] = 19;
    emit Done();
  }

  function nestedDynamicMemoryTest() public
  {
    uint[][] memory arr;
    uint[][] memory comparisonArr;

    arr = new uint[][](3);
    comparisonArr = new uint[][](3);

    arr[2] = new uint[](4);
    arr[2][0] = 10;
    arr[2][1] = 12;
    arr[2][2] = 13;
    arr[2][3] = 14;
    arr[1] = new uint[](2);
    arr[1][0] = 33;
    arr[1][1] = 35;
    arr[0] = new uint[](1);
    arr[0][0] = 65;

    comparisonArr[0] = new uint[](0);
    comparisonArr[1] = new uint[](0);
    comparisonArr[2] = new uint[](0);

    emit Done();
  }

  function pointerToEmptyArrayTest() public
  {
    uint[][] memory arr;
    arr = new uint[][](2);
    arr[1] = new uint[](1);
    arr[1][0] = 33;
    arr[0] = new uint[](0);
    arr[0] = new uint[](3);
    arr[1] = new uint[](5);
    emit Done();
  }

  function nullPointerOnStackTest(uint pre, uint[] memory shouldBeNull) public returns (uint post)
  {
    post = pre + shouldBeNull.length;
    emit Done();
  }

  function nullPointerOnStackTester() public
  {
    uint[] memory nullPointer;
    nullPointerOnStackTest(258, nullPointer);
  }

  /*
  function staticallyEmptyArrayTest() public returns (uint[0] storage pointsToNull)
  {
    preMarker = 254;
    postMarker = 253;
    pointsToNull = nullStorage;
    emit Done();
  }

  function staticallyEmptyStructTest() public
  {
    preMarker = 254;
    postMarker = 253;
    Empty storage pointsToNull = nullStruct;
    emit Done();
  }
  */

  function calldataPointerTest(uint8[2] calldata twoBytes) external returns (uint8 result)
  {
    result = twoBytes[0] + twoBytes[1];
    emit Done();
  }

  function calldataPointerTester() public
  {
    uint8[2] memory twoBytes;
    twoBytes[0] = 17;
    twoBytes[1] = 34;
    this.calldataPointerTest(twoBytes);
  }

  function semiDynamicTest() public
  {
    uint[][2][] memory levelThree;
    levelThree = new uint[][2][](2);
    levelThree[0][0] = new uint[](4);
    levelThree[0][1] = new uint[](5);
    levelThree[1][0] = new uint[](6);
    levelThree[1][1] = new uint[](7);

    SemiDynamic[] memory silliness;
    silliness = new SemiDynamic[](2);
    silliness[0].head = 65;
    silliness[1].head = 66;
    silliness[0].tail = new uint[](8);
    silliness[1].tail = new uint[](9);

    emit Done();
  }

  function constructorParameterTest() public
  {
    ConstructorTest test;
    test = new ConstructorTest(33, 34, 35);
    test.workaround();
  }

  function derivedConstructorParameterTest() public
  {
    DerivedTest derived;
    AutoDerivedTest autoDerived;

    derived = new DerivedTest(33, 34, 35);
    autoDerived = new AutoDerivedTest(33, 34, 35);

    derived.workaround();
    autoDerived.workaround();
  }

  /*
  function constructorCalldataTest() public
  {
    uint[2] memory arr1;
    uint[2] memory arr2;
    ConstructorCalldataTest test;
    arr1[0] = 17;
    arr1[1] = 18;
    arr2[0] = 33;
    arr2[1] = 34;
    test = new ConstructorCalldataTest(arr1, arr2);
    test.workaround();
  }
  */

  function constructorDirectCalldataTest() public
  {
    ConstructorDirectCalldataTest test;
    test = new ConstructorDirectCalldataTest("hello world!");
    test.workaround();
  }

  function notACompileError(function (uint8) external[2] calldata thisIsSilly) external
  {
    thisIsSilly[0](3);
  }

  /*
  function compileError(function (uint8) internal[2] calldata thisIsVerySilly) external
  {
    thisIsVerySilly[0](42);
  }
  */

  /*  these need V2 :(
  function nestedCalldataTest(uint[][] calldata arr) external
  {
    uint[][] memory copy;
    copy = arr;
    emit Done();
  }

  function nestedCalldataTester() public
  {
    uint[][] memory arr;

    arr = new uint[][](3);

    arr[2] = new uint[](4);
    arr[2][0] = 10;
    arr[2][1] = 12;
    arr[2][2] = 13;
    arr[2][3] = 14;
    arr[1] = new uint[](2);
    arr[1][0] = 33;
    arr[1][1] = 35;
    arr[0] = new uint[](1);
    arr[0][0] = 65;

    this.nestedCalldataTest(arr);
  }
  */

  function multipleInheritanceTest() public
  {
    MultipleInheritanceTest test;
    test = new MultipleInheritanceTest(35,34,33);
    test.workaround();
  }

  function codeOffsetsTest() public
  {
    function() internal[3] memory someFunctions;
    someFunctions[0] = storagePointerTest;
    someFunctions[1] = memoryBytesTest;
    someFunctions[2] = internalTester;
    emit Done();
  }

  /*
  function defaultValuesTest() internal returns (bool boolean, Ternary ternary, address nowhere, ConstructorTest alsoNowhere, function() internal blindJump, function() external blindCall)
  {
    bytes memory noBytes;
    blindJump(); //hoo boy!
    emit Done();
  }

  function defaultValuesTester() public
  {
    defaultValuesTest();
  }
  */

  function mappingTest() public
  {
    preMappingBarrier = -1;
    map[0] = 0xbabababa;
    map[1] = 0xdededede;
    map[2] = 0xf0f0f0f0;
  }

  function sharedMemoryTest() public
  {
    uint[][2] memory arr1;
    uint[][2] memory arr2;
    arr1[0] = new uint[](2);
    arr2[0] = arr1[0];
    emit Done();
  }

  function dynamicAssignTest() public
  {
    uint[][2][2] memory arr;
    arr[1] = arr[0];
    emit Done();
  }

  function staticAssignTest() public
  {
    uint[2][2] memory arr;
    arr[0][0] = 49;
    arr[0][1] = 50;
    arr[1] = arr[0];
    emit Done();
  }

  function structAssignTest() public
  {
    Pair[2] memory arr;
    arr[0].x = 49;
    arr[0].y = 50;
    arr[1] = arr[0];
    emit Done();
  }

  function deleteTest() public
  {
    uint[] memory arr;
    arr = new uint[](3);
    delete arr;
    emit Done();
  }

  function deleteStaticTest() public
  {
    uint[2][2] memory arr;
    Pair[2] memory pairArr;
    arr[0][0] = 1;
    arr[0][1] = 2;
    arr[1][0] = 3;
    arr[1][1] = 4;
    pairArr[0].x = 5;
    pairArr[0].y = 6;
    pairArr[1].x = 7;
    pairArr[1].y = 8;
    delete arr[0];
    delete pairArr[0];
    emit Done();
  }

  function defaultStorageTest() internal returns (uint16[2] storage arr, uint16 out1, uint16 out2)
  {
    arr = arr;
    w0 = 0x01234567;
    out1 = arr[0];
    out2 = arr[1];
    /*
    arr = w1b0b3;
    arr[0] = out1;
    arr[1] = out2;
    delete arr;
    */
    emit Done();
  }

  function defaultStorageTester() public
  {
    defaultStorageTest();
  }

  /*
  function overloadTest() public
  {
    function (uint8) internal over1;
    function (address) internal over2;
    function (uint8) external over1e;
    function (address) external over2e;
    over1 = overloaded;
    over2 = overloaded;
    over1e = this.overloaded;
    over2e = this.overloaded;
    emit Done();
  }

  function overloaded(uint8 x) public
  {
    emit Done();
  }

  function overloaded(address x) public
  {
    emit Done();
  }
  */

  /*
  function deleteCalldataTest(string calldata hello) external
  {
    delete hello;
    emit Done();
  }
  */

  /*
  function gasValueTest() public returns (function () external payable result1, function () external payable result2)
  {
    function () external payable[2] memory sillyArray;
    result1 = this.payableTest;
    //result2 = result1.gas(3333).value(3535);
    sillyArray[0] = result1;
    //sillyArray[1] = result2;
    //sillyArray[1] = result1.gas(3333).value(3535);
    payHere1 = result1;
    //payHere2 = result2;
    //payHere2 = result1.gas(3333).value(3535);
  }

  function payableTest() external payable
  {
    emit Done();
  }

  function gasValueZeroTest() public returns (function () external payable result1, function () external payable result2)
  {
    function () external payable[2] memory sillyArray;
    result1 = this.payableTest;
    result2 = result1.value(0);
    sillyArray[0] = result1;
    sillyArray[1] = result2;
    sillyArray[1] = result1.value(0);
    payHere1 = result1;
    payHere2 = result1.value(0);
  }
  */

  /*
  function calldataAssignTest(string calldata str1, string calldata str2) external
  {
    str2 = str1;
    emit Done();
  }

  function calldataAssignTester() public
  {
    this.calldataAssignTest("hello", "goodbye");
  }
  */

  function funcMappingTest() internal returns (function (uint8) internal stackFunc)
  {
    //function (uint8) internal[2] memory funcArray;
    funcMapping[0] = frameTest;
    delete funcMapping[0];
    funcMapping[1] = stackFunc;
    delete funcMapping[1];
    delete funcMapping[2];
    stackFunc = funcMapping[2];
    delete stackFunc;
    stackFunc = frameTest;
    delete stackFunc;
    emit Done();
  }

  function funcMappingTester() public
  {
    funcMappingTest();
  }

  function funcMappingFailureTest() public
  {
    function (uint8) internal stackFunc;
    funcMapping[0] = frameTest;
    delete funcMapping[0];
    funcMapping[1] = stackFunc;
    delete funcMapping[1];
    delete funcMapping[2];
    intf(3);
    funcMapping[3](3);
    emit Done();
  }

  function externalFailureTest() public
  {
    function () external badFunc;
    badFunc();
  }

  function contractFailureTest() public
  {
    AllocTest zero;
    zero.frameTest(3);
  }

  function structMappingMemoryTest() public
  {
    ContainsMapping memory containsMapping;
    //mapping(uint => uint)[2] memory totallyIllegal;
    containsMapping.x = 49;
    containsMapping.y = 50;
    emit Done();
  }

  function mappingsOnlyTest() public
  {
    uint[2] memory arr1;
    MappingsOnly memory mappingsOnly;
    uint[2] memory arr2;
    arr1[0] = 1;
    arr1[1] = 2;
    mappingsOnly = MappingsOnly();
    arr2[0] = 3;
    arr2[1] = 4;
    emit Done();
  }

  function typeCodeTest() internal returns (bytes memory cCode, bytes memory rCode, string memory name, string memory test)
  {
    cCode = type(ConstructorTest).creationCode;
    rCode = type(ConstructorTest).runtimeCode;
    name = type(ConstructorTest).name;
    test = "alignment test";
    emit Done();
  }

  function typeCodeTester() public
  {
    typeCodeTest();
  }

  /*
  function circularityCompileTest(Tree memory argumentTree) public
  {
    Tree memory memoryTree; //allowed!
    MappingTree memory memoryMappingTree; //allowed!
    emit Done();
  }
  */
  
  //compile error!
  /*
  function circularCopyTest() public
  {
    Tree memory it;
    it.x = 9;
    it.children = new Tree[](1);
    it.children[0] = it;
    tree = it;
    emit Done();
  }
  */

  //stack overflow!
  function circularStorageTest() public
  {
    tree.x = 9;
    tree.children.length = 1;
    tree.children[0] = tree;
    emit Done();
  }

  //causes Truffle error
  /*
  function copyCircularTypeToMemoryTest() public
  {
    Tree memory memoryTree;
    tree.x = 107;
    tree.children.length = 1;
    tree.children[0].x = 214;
    memoryTree = tree;
    emit Done();
  }
  */

  function viewTypeTest() public view returns (uint) {
    return w0;
  }

  function viewTypeTester() public {
    function() external view returns (uint) f;
    f = this.viewTypeTest;
    f = this.w0;
    f();
    emit Done();
  }

  function() external {
    bytes memory data = msg.data;
    bytes4 sig = msg.sig;
    emit Received(data, sig);
  }

  function bareCallTest() public returns (bool, bytes memory) {
    return address(this).call(hex"face");
  }

  function tupleTest() public returns (uint z) {
    (uint x, uint y) = (3, 5);
    z = x * y;
    emit Done();
  }

  function UDTArgsTest(Pair memory p, Ternary t, address payable a, AllocTest at, Pair[] memory pa) public pure returns (uint) {
    if(t == Ternary.yes) {
      return p.x;
    }
    if(t == Ternary.no) {
      return uint(a) + uint(address(at));
    }
    return pa.length;
  }

}

contract ConstructorTest {

  uint8 x;
  uint8 y;
  uint8 z;

  event Done();

  constructor(uint8 a, uint8 b, uint8 c) public
  {
    x = a;
    y = b;
    z = c;
  }

  function workaround() public
  {
    emit Done();
  }
}

contract DerivedTest is ConstructorTest {

  uint8 x2;
  uint8 y2;
  uint8 z2;

  constructor(uint8 a, uint8 b, uint8 c) ConstructorTest(a + 32, b + 32, c + 32) public {
    x2 = a;
    y2 = b;
    z2 = c;
  }
}

contract AutoDerivedTest is ConstructorTest(100,101,102) {

  uint8 x2;
  uint8 y2;
  uint8 z2;

  constructor(uint8 a, uint8 b, uint8 c) public {
    x2 = a;
    y2 = b;
    z2 = c;
  }
}

/*
contract ConstructorCalldataTest {

  uint[2] store1;
  uint[2] store2;

  event Done();

  constructor(uint[2] calldata arr1, uint[2] calldata arr2) public {
    store1 = arr1;
    store2 = arr2;
  }

  function workaround() public
  {
    emit Done();
  }
}
*/

contract ConstructorDirectCalldataTest {

  bytes4 sig;
  bytes data;
  string aString;

  event Done();

  constructor(string memory hello) public {
    data = msg.data;
    sig = msg.sig; //just for curiosity
    aString = hello;
  }

  function workaround() public
  {
    emit Done();
  }
}

contract Parent1 {
  uint p1;
  constructor(uint _p1) public
  {
    p1 = _p1;
  }
}

contract Parent2 {
  uint p2;
  constructor(uint _p2) public
  {
    p2 = _p2;
  }
}

contract MultipleInheritanceTest is Parent2, Parent1 {
  uint own;

  event Done();

  constructor(uint _own, uint p1, uint p2) Parent1(p1) Parent2(p2) public
  {
    own = _own;
  }

  function workaround() public
  {
    emit Done();
  }
}

/*
contract MethodInheritanceTest {
  event Done();
  function test() public
  {
    function() internal fi = test;
    function() external fe = this.test;
    emit Done();
  }
}

contract DerivedMethodTest is MethodInheritanceTest {
  function run() public
  {
    function() internal fi = test;
    function() external fe = this.test;
    emit Done();
  }
}
*/

library LibraryABITest {
  event AnEvent();

  function test() external {
    emit AnEvent();
  }
}

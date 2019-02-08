const Web3 = require("web3");
const BN = Web3.utils.BN;
//presently unexplained outcomes are marked "??"

console.log("int8")
console.log("1, unpadded")
console.log(Web3.utils.soliditySha3('0x01', new BN(0)));
console.log("1, manually padded")
console.log(Web3.utils.soliditySha3('0x0000000000000000000000000000000000000000000000000000000000000001', new BN(0)));
console.log("1, automatic")
console.log(Web3.utils.soliditySha3(new BN(1), new BN(0)));
console.log("1, object")
console.log(Web3.utils.soliditySha3({type: "int8", value: new BN(1)}, new BN(0)));
console.log("1, object w/string")
console.log(Web3.utils.soliditySha3({type: "int8", value: "1"}, new BN(0)));
console.log("1, int object")
console.log(Web3.utils.soliditySha3({type: "int", value: new BN(1)}, new BN(0)));
console.log("1, int object w/string")
console.log(Web3.utils.soliditySha3({type: "int", value: "1"}, new BN(0)));
console.log("-1, unpadded")
console.log(Web3.utils.soliditySha3('0xff', new BN(0)));
console.log("-1, manually padded")
console.log(Web3.utils.soliditySha3('0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', new BN(0)));
console.log("-1, automatic")
console.log(Web3.utils.soliditySha3(new BN(-1), new BN(0)));
console.log("-1, object")
console.log(Web3.utils.soliditySha3({type: "int8", value: new BN(-1)}, new BN(0)));
console.log("-1, object w/string")
console.log(Web3.utils.soliditySha3({type: "int8", value: "-1"}, new BN(0)));
console.log("-1, int object")
console.log(Web3.utils.soliditySha3({type: "int", value: new BN(-1)}, new BN(0)));
console.log("-1, int object w/string")
console.log(Web3.utils.soliditySha3({type: "int", value: "-1"}, new BN(0)));
console.log();
console.log("bytes1")
console.log("0x01, unpadded")
console.log(Web3.utils.soliditySha3('0x01', new BN(0)));
console.log("0x01, manually padded")
console.log(Web3.utils.soliditySha3('0x0100000000000000000000000000000000000000000000000000000000000000', new BN(0)));
console.log("0x01, object")
console.log(Web3.utils.soliditySha3({type: "bytes1", value: "0x01"}, new BN(0)));
console.log("0x01, bytes32 object")
console.log(Web3.utils.soliditySha3({type: "bytes32", value: "0x01"}, new BN(0)));
console.log("0xff, unpadded")
console.log(Web3.utils.soliditySha3('0xff', new BN(0)));
console.log("0xff, manually padded")
console.log(Web3.utils.soliditySha3('0xff00000000000000000000000000000000000000000000000000000000000000', new BN(0)));
console.log("0xff, object")
console.log(Web3.utils.soliditySha3({type: "bytes1", value: "0xff"}, new BN(0)));
console.log("0xff, bytes32 object")
console.log(Web3.utils.soliditySha3({type: "bytes32", value: "0xff"}, new BN(0)));
console.log();
console.log("boolean");
console.log("true, unpadded")
console.log(Web3.utils.soliditySha3('0x01', new BN(0)));
console.log("true, manually padded")
console.log(Web3.utils.soliditySha3('0x0000000000000000000000000000000000000000000000000000000000000001', new BN(0)));
console.log("true, automatic")
console.log(Web3.utils.soliditySha3(true, new BN(0)));
console.log("true, object")
console.log(Web3.utils.soliditySha3({type: "bool", value: true}, new BN(0)));
//console.log("true, uint object")
//console.log(Web3.utils.soliditySha3({type: "uint", value: true}, new BN(0)));
console.log("true, uint object w/string")
console.log(Web3.utils.soliditySha3({type: "uint", value: "true"}, new BN(0))); //??
console.log("false, unpadded")
console.log(Web3.utils.soliditySha3('0x00', new BN(0)));
console.log("false, manually padded")
console.log(Web3.utils.soliditySha3('0x0000000000000000000000000000000000000000000000000000000000000000', new BN(0)));
console.log("false, automatic")
console.log(Web3.utils.soliditySha3(false, new BN(0)));
console.log("false, object")
console.log(Web3.utils.soliditySha3({type: "bool", value: false}, new BN(0)));
//console.log("false, uint object")
//console.log(Web3.utils.soliditySha3({type: "uint", value: false}, new BN(0)));
console.log("false, uint object w/string")
console.log(Web3.utils.soliditySha3({type: "uint", value: "false"}, new BN(0))); //??
console.log();
console.log("address")
console.log("test addr, unpadded")
console.log(Web3.utils.soliditySha3('0x30aA7e340926854cd779ba3180F793dCC778F6B5', new BN(0)));
console.log("1 addr, manually padded")
console.log(Web3.utils.soliditySha3('0x00000000000000000000000030aA7e340926854cd779ba3180F793dCC778F6B5', new BN(0)));
console.log("1 addr, object")
console.log(Web3.utils.soliditySha3({type: "address", value: "0x30aA7e340926854cd779ba3180F793dCC778F6B5"}, new BN(0)));
console.log("1 addr, uint object")
console.log(Web3.utils.soliditySha3({type: "uint", value: "0x30aA7e340926854cd779ba3180F793dCC778F6B5"}, new BN(0)));
console.log();
console.log("nullity")
console.log("null string")
console.log(Web3.utils.soliditySha3("", new BN(0)));
console.log("null string, object")
console.log(Web3.utils.soliditySha3({type: "string", value: ""}, new BN(0)));
console.log("null bytestring")
console.log(Web3.utils.soliditySha3("0x", new BN(0)));
console.log("null bytestring, object")
console.log(Web3.utils.soliditySha3({type: "bytes", value: "0x"}, new BN(0)));
console.log();
console.log("complete nullity")
console.log("null string")
console.log(Web3.utils.soliditySha3(""));
console.log("null string, object")
console.log(Web3.utils.soliditySha3({type: "string", value: ""}));
console.log("null bytestring")
console.log(Web3.utils.soliditySha3("0x"));
console.log("null bytestring, object")
console.log(Web3.utils.soliditySha3({type: "bytes", value: "0x"}));
console.log("null string, no solidity")
console.log(Web3.utils.sha3(""));
console.log("one byte")
console.log(Web3.utils.soliditySha3("0x00"));
//console.log();
//console.log("nonsense object");
//console.log(Web3.utils.soliditySha3({type: "manual", value: "false"}));

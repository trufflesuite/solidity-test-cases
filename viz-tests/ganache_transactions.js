const Web3 = require('web3');
const web3 = new Web3('http://localhost:8545');

const latestBlockNumber = async () => {
  const lb = await web3.eth.getBlock('latest');
  return lb.number;
}

const blocks = async () => {
  let bin = 1;
  let end = await latestBlockNumber();

  while (bin < end) {
    let block = await web3.eth.getBlock(bin++, true);
    for (const tx of block.transactions) {
      console.log(tx.hash);
    }
  }
}


blocks().then(() => {
  console.log('done!');
});

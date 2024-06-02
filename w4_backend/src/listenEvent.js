const {ethers} = require("ethers");

const ERC20ABI = require(`../deployments/abi/ERC2612.json`);
const ERC20Addr = require(`../deployments/dev/ERC2612.json`);

async function main() {
    let provider = new ethers.providers.WebSockeProvider('ws://127.0.0.1:8545');
    let myerc20 = new ethers.Contract(ERC20Addr.address, ERC20ABI, provider);
    let filter = myerc20.filters.Transfer();

    
}
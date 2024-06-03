const {ethers} = require("ethers");

const ERC20ABI = require(`../deployments/abi/ERC2612.json`);
const ERC20Addr = require(`../deployments/dev/ERC2612.json`);

async function parseTransferEvent(event) {
    const TransferEvent = new ethers.utils.Interface(["event Transfer(address indexed from,address indexed to,uint256 value)"]);
    let decodedData = TransferEvent.parseLog(event);
    console.log("from:" + decodedData.args.from);
    console.log("to:" + decodedData.args.to);
    console.log("value:" + decodedData.args.value.toString());
}

async function main() {
    let provider = new ethers.providers.WebSocketProvider('ws://127.0.0.1:8545');
    let myerc20 = new ethers.Contract(ERC20Addr.address, ERC20ABI, provider);
    let filter = myerc20.filters.Transfer();

    provider.on(filter, (event) => {
        console.log(event);
        parseTransferEvent(event);
    })
}

main()
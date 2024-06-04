forge clean && forge build && forge test --ffi

forge script --fork-url http://localhost:8545 script/DeployVault.s.sol  --broadcast
forge script --fork-url $RPC_URL --private-key $PRIVATE_KEY script/DeployVault.s.sol --broadcast --verify -vvvv

forge verify-contract --rpc-url $RPC_URL 0x61731e0630548e7aD0b8cCeE9e015548Bb987a89 src/ERC2612.sol:ERC2612 --watch --flatten
forge verify-contract --rpc-url $RPC_URL --constructor-args $(cast abi-encode "constructor(address)" 0x61731e0630548e7aD0b8cCeE9e015548Bb987a89) 0xEb61908872BDcf05fa2d4D089eB70F749d84BE9b src/Bank.sol:Bank --watch --flatten

remixd -s /Users/lipengyi/sol/denglian2/homework2_denglian/w5_dex -u https://remix.ethereum.org
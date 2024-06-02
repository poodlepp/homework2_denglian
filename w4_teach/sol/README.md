
forge clean && forge build && forge test --ffi

forge script --fork-url http://localhost:8545 script/DeployVault.s.sol  --broadcast
forge script --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY script/DeployVault.s.sol --broadcast --verify -vvvv
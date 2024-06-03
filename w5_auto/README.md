
forge clean && forge build && forge test --ffi

forge script --fork-url http://localhost:8545 script/DeployVault.s.sol  --broadcast
forge script --fork-url $RPC_URL    --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY -vvvv script/DeployVault.s.sol

脚本中已经设置了startBoard 所以命令里面应该不需要加
--private-key $PRIVATE_KEY


forge inspect src/erc20/Pengyi.sol:MyERC20 abi >> MyERC20.json


remixd -s /Users/lipengyi/sol/denglian2/homework2_denglian/w5_auto -u https://remix.ethereum.org


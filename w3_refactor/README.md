## Foundry
forge install foundry-rs/forge-std --no-commit 
forge install openzeppelin/openzeppelin-contracts --no-commit
forge install OpenZeppelin/openzeppelin-contracts-upgradeable --no-commit
forge install OpenZeppelin/openzeppelin-foundry-upgrades --no-commit


forge install git@github.com:OpenZeppelin/openzeppelin-contracts.git --no-commit
forge install https://github.com/OpenZeppelin/openzeppelin-contracts.git@v4.9.6 --no-commit

https://github.com/foundry-rs/forge-std.git
https://github.com/OpenZeppelin/openzeppelin-contracts.git
https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable.git
https://github.com/OpenZeppelin/openzeppelin-foundry-upgrades.git




remixd -s /Users/lipengyi/sol/denglian2/homework2_denglian/w4 -u https://remix.ethereum.org

forge clean && forge build && forge test --ffi

forge script --fork-url http://localhost:8545 script/DeployVault.s.sol  --broadcast
forge script --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY script/DeployVault.s.sol --broadcast --verify -vvvv


forge inspect src/erc20/Pengyi.sol:MyERC20 abi >> MyERC20.json

## 遗留问题

我实现的是透明代理，例子中是foundry upgrades  UUPS
https://learnblockchain.cn/article/7328  学习程度80%


直接使用TransparentUpgradeableProxy 部署代理合约，最后在upgradeToAndCall 总是失败，没有详细原因；
我也是通过chaintool.tech  进行了abi编码 

remix中通过代理合约进行调用  看不到output；
etherscan中没有找到 low level interaction  入口；可能是sepolia没有开放

etherscan 中可以调用代理的合约的 read / write

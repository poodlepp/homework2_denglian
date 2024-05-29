## Foundry
forge install foundry-rs/forge-std --no-commit 
forge install openzeppelin/openzeppelin-contracts --no-commit
forge install OpenZeppelin/openzeppelin-contracts-upgradeable --no-commit
forge install OpenZeppelin/openzeppelin-foundry-upgrades --no-commit

remixd -s /Users/lipengyi/sol/denglian2/homework2_denglian/w4 -u https://remix.ethereum.org

forge clean && forge build && forge test --ffi

forge script script/DeployToken.s.sol --rpc-url sepolia --private-key $PRIVATE_KEY --broadcast 

## 遗留问题

我实现的是透明代理，例子中是foundry upgrades  UUPS
https://learnblockchain.cn/article/7328  学习程度80%


直接使用TransparentUpgradeableProxy 部署代理合约，最后在upgradeToAndCall 总是失败，没有详细原因；
我也是通过chaintool.tech  进行了abi编码 

remix中通过代理合约进行调用  看不到output；
etherscan中没有找到 low level interaction  入口；可能是sepolia没有开放

etherscan 中可以调用代理的合约的 read / write

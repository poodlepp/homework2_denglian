// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.5.16;

import "forge-std/Script.sol";

abstract contract BaseScript is Script {

  /**
   * @dev 使用助记词的方式
   * string internal mnemonic = vm.envString("MNEMONIC");;
   * address internal deployer;
   * uint256 internal privateKey;
   * (deployer, privateKey) = deriveRememberKey(mnemonic, 0);
   * vm.startBroadcast(deployer);
   */

    uint256 internal privateKey;

    function setUp() public virtual {
      privateKey = vm.envUint("PRIVATE_KEY");
    }

    function saveContract(string memory network, string memory name, address addr) public {
      string memory json1 = "key";
      string memory finalJson =  vm.serializeAddress(json1, "address", addr);
      string memory dirPath = string.concat(string.concat("output/", network), "/");
      vm.writeJson(finalJson, string.concat(dirPath, string.concat(name, ".json"))); 
    }

    modifier broadcaster() {
        vm.startBroadcast(privateKey);
        _;
        vm.stopBroadcast();
    }
}

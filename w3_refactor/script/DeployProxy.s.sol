// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import "../src/upgrade/MyERC20V1.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "forge-std/Script.sol";

contract DeployUUPSProxy is Script {
    function run() public {

        address _implementation = 0x7A3498E0E601924abbc6b08414852AF9E9B9F03a; // Replace with your token address
        vm.startBroadcast();

        // Encode the initializer function call
        bytes memory data = abi.encodeWithSelector(
            MyERC20V1(_implementation).initialize.selector
             // Initial owner/admin of the contract
        );

        // Deploy the proxy contract with the implementation address and initializer
        ERC1967Proxy proxy = new ERC1967Proxy(_implementation, data);

        vm.stopBroadcast();
        // Log the proxy address
        console.log("UUPS Proxy Address:", address(proxy));
    }
}

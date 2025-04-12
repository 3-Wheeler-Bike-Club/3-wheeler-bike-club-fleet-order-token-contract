// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {FleetOrderToken} from "../src/FleetOrderToken.sol";

contract FleetOrderTokenScript is Script {
    FleetOrderToken public fleetOrderToken;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        fleetOrderToken = new FleetOrderToken();

        vm.stopBroadcast();
    }
}

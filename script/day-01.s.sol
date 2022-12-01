// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";

contract Day01Script is Script {
    string input;

    function setUp() public {
        input = vm.readFile("./script/input/day-01.txt");
    }

    function run() public {}
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "./lib/StringsPlusPlus.sol";

contract Day01Script is Script {
    using StringsPlusPlus for string;

    string rawInput;
    uint256[][] input;

    function setUp() public {
        rawInput = vm.readFile("./script/input/day-01.txt");
    }

    function run() public {
        string[] memory split = rawInput.split("\n");
    }
}

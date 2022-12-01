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

    function run() public view {
        part1();
        part2();
    }

    function part1() public view {
        string[] memory split = rawInput.split("\n");

        uint256 highestCalories = 0;
        uint256 tmpSum = 0;
        for (uint256 i = 0; i < split.length; i++) {
            if (split[i].equal("")) {
                highestCalories = tmpSum > highestCalories ? tmpSum : highestCalories;
                tmpSum = 0;
            } else {
                tmpSum += split[i].parseInt();
            }
        }

        console.log("Part 1: ", highestCalories);
    }

    function part2() public view {
        string[] memory split = rawInput.split("\n");

        uint256[] memory calorieSums = new uint256[][](split.length);
        uint256 tmpSum = 0;
        for (uint256 i = 0; i < split.length; i++) {
            if (split[i].equal("")) {
                calorieSums[] tmpSum = 0;
            } else {
                tmpSum += split[i].parseInt();
                console.log(split[i].parseInt());
            }
        }

        console.log("Part 1: ", highestValue);
    }
}

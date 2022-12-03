// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "TheAlgorithms/Sorts/BubbleSort.sol";
import "./lib/StringsPlusPlus.sol";

contract Day01Script is Script, BubbleSort {
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

        console.log("Part 1 solution: ", highestCalories);
    }

    function part2() public view {
        string[] memory split = rawInput.split("\n");

        uint256 elves = 1;
        for (uint256 i = 0; i < split.length; i++) {
            elves = split[i].equal("") ? elves + 1 : elves;
        }

        uint256 currentElf = 0;
        uint256[] memory calorieSums = new uint256[](elves);
        for (uint256 i = 0; i < split.length; i++) {
            if (split[i].equal("")) {
                currentElf += 1;
            } else {
                calorieSums[currentElf] += split[i].parseInt();
            }
        }

        uint256[] memory sortedCalorieSums = bubbleSort(calorieSums);
        uint256 calorieSum = sortedCalorieSums[elves - 1] + sortedCalorieSums[elves - 2] + sortedCalorieSums[elves - 3];

        console.log("Part 2 solution: ", calorieSum);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "TheAlgorithms/Sorts/BubbleSort.sol";
import "./lib/StringsPlusPlus.sol";

contract Day04Script is Script, BubbleSort {
    using StringsPlusPlus for string;

    string rawInput;

    function setUp() public {
        rawInput = vm.readFile("./script/input/day-04.txt");
    }

    function run() public view {
        part1();
        part2();
    }

    function part1() public view {
        string[] memory split = rawInput.split("\n");

        uint256 score = 0;
        for (uint256 i = 0; i < split.length; i++) {
            string[] memory assignments = split[i].split(",");
            string[] memory elf1 = assignments[0].split("-");
            string[] memory elf2 = assignments[1].split("-");

            (uint256 elf1Start, uint256 elf1End) = (elf1[0].parseInt(), elf1[1].parseInt());
            (uint256 elf2Start, uint256 elf2End) = (elf2[0].parseInt(), elf2[1].parseInt());

            if ((elf1Start <= elf2Start && elf1End >= elf2End) || (elf2Start <= elf1Start && elf2End >= elf1End)) {
                score += 1;
            }
        }

        console.log("Part 1 solution: ", score);
    }

    function part2() public view {
        string[] memory split = rawInput.split("\n");

        uint256 score = 0;
        for (uint256 i = 0; i < split.length; i++) {
            string[] memory assignments = split[i].split(",");
            string[] memory elf1 = assignments[0].split("-");
            string[] memory elf2 = assignments[1].split("-");

            (uint256 elf1Start, uint256 elf1End) = (elf1[0].parseInt(), elf1[1].parseInt());
            (uint256 elf2Start, uint256 elf2End) = (elf2[0].parseInt(), elf2[1].parseInt());

            if ((elf1Start <= elf2End && elf1End >= elf2Start) || (elf2Start <= elf1End && elf2End >= elf1Start)) {
                score += 1;
            }
        }

        console.log("Part 2 solution: ", score);
    }
}

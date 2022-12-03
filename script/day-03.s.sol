// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "TheAlgorithms/Sorts/BubbleSort.sol";
import "./lib/StringsPlusPlus.sol";

contract Day03Script is Script, BubbleSort {
    using StringsPlusPlus for string;

    string rawInput;

    // rucksack id -> -> letter id -> exists
    mapping(uint256 => mapping(uint256 => bool)) itemExists;

    // elf id -> letter id -> held
    mapping(uint256 => mapping(uint256 => bool)) elfHolds;

    function setUp() public {
        rawInput = vm.readFile("./script/input/day-03.txt");
    }

    function run() public {
        part1();
        part2();
    }

    function part1() public {
        string[] memory split = rawInput.split("\n");

        uint256 score = 0;
        for (uint256 i = 0; i < split.length; i++) {
            string[] memory items = split[i].split("");

            for (uint256 j = 0; j < items.length / 2; j++) {
                uint256 letter = uint8(bytes(items[j])[0]);
                itemExists[i][letter] = true;
            }

            for (uint256 j = items.length / 2; j < items.length; j++) {
                uint256 letter = uint8(bytes(items[j])[0]);

                if (itemExists[i][letter]) {
                    score += letter > 90 ? letter - 96 : letter - 64 + 26;
                    break;
                }
            }
        }

        console.log("Part 1 solution:", score);
    }

    function part2() public {
        string[] memory split = rawInput.split("\n");

        uint256 score = 0;
        for (uint256 i = 0; i < split.length; i++) {
            string[] memory items = split[i].split("");

            for (uint256 j = 0; j < items.length; j++) {
                uint256 letter = uint8(bytes(items[j])[0]);
                elfHolds[i][letter] = true;

                if ((i + 1) % 3 == 0 && elfHolds[i - 1][letter] && elfHolds[i - 2][letter]) {
                    score += letter > 90 ? letter - 96 : letter - 64 + 26;
                    break;
                }
            }
        }

        console.log("Part 2 solution:", score);
    }
}

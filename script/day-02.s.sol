// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "TheAlgorithms/Sorts/BubbleSort.sol";
import "./lib/StringsPlusPlus.sol";

contract Day02Script is Script, BubbleSort {
    using StringsPlusPlus for string;

    string rawInput;

    function setUp() public {
        rawInput = vm.readFile("./script/input/day-02.txt");
    }

    function run() public view {
        part1();
        part2();
    }

    function part1() public view {
        string[] memory split = rawInput.split("\n");

        uint256 score = 0;
        for (uint256 i = 0; i < split.length; i++) {
            string[] memory moves = split[i].split(" ");
            string memory elfMove = moves[0];
            string memory myMove = moves[1];

            if (
                (elfMove.equal("A") && myMove.equal("X")) || (elfMove.equal("B") && myMove.equal("Y"))
                    || (elfMove.equal("C") && myMove.equal("Z"))
            ) {
                score += 3;
            } else if (
                (elfMove.equal("A") && myMove.equal("Y")) || (elfMove.equal("B") && myMove.equal("Z"))
                    || (elfMove.equal("C") && myMove.equal("X"))
            ) {
                score += 6;
            }

            score += myMove.equal("X") ? 1 : myMove.equal("Y") ? 2 : 3;
        }

        console.log("Part 1 solution:", score);
    }

    function part2() public view {
        string[] memory split = rawInput.split("\n");

        uint256 score = 0;
        for (uint256 i = 0; i < split.length; i++) {
            string[] memory moves = split[i].split(" ");
            string memory elfMove = moves[0];
            string memory myMove = moves[1];

            if (myMove.equal("X")) {
                score += elfMove.equal("A") ? 3 : elfMove.equal("B") ? 1 : 2;
            } else if (myMove.equal("Y")) {
                score += elfMove.equal("A") ? 1 : elfMove.equal("B") ? 2 : 3;
            } else if (myMove.equal("Z")) {
                score += elfMove.equal("A") ? 2 : elfMove.equal("B") ? 3 : 1;
            }

            score += myMove.equal("X") ? 0 : myMove.equal("Y") ? 3 : 6;
        }

        console.log("Part 2 solution:", score);
    }
}

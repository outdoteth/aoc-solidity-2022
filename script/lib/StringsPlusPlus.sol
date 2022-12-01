// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "solidity-stringutils/strings.sol";

library StringsPlusPlus {
    using strings for *;

    function split(string memory str, string memory delim) internal pure returns (string[] memory output) {
        strings.slice memory s = str.toSlice();
        strings.slice memory delimSlice = delim.toSlice();
        output = new string[](s.count(delimSlice) + 1);

        for (uint256 i = 0; i < output.length; i++) {
            output[i] = s.split(delimSlice).toString();
        }
    }
}

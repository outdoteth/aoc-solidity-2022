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

    function parseInt(string memory str) internal pure returns (uint256 output) {
        bytes memory _bytesValue = bytes(str);
        uint256 j = 1;
        uint256 i = _bytesValue.length - 1;
        while (i >= 0) {
            assert(uint8(_bytesValue[i]) >= 48 && uint8(_bytesValue[i]) <= 57);
            output += (uint8(_bytesValue[i]) - 48) * j;
            j *= 10;
            if (i > 0) i--;
            else break;
        }
    }

    function equal(string memory str, string memory cmp) internal pure returns (bool) {
        return keccak256(abi.encodePacked(str)) == keccak256(abi.encodePacked(cmp));
    }
}

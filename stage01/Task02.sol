// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Test02{

    function reverseString(string memory str) public pure returns(string memory) {
        bytes memory bytesStr = bytes(str);
        bytes memory resultBytes = new bytes(bytesStr.length);
        for (uint256 i = 0; i < bytesStr.length; i++) {
            resultBytes[i] = bytesStr[bytesStr.length-1-i];
        }
        return string(resultBytes);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task04{
    
    mapping (uint16 => string) private romanMap;

    uint16[] private intArr = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    string[] private romanArr = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];


    function intToRoman(uint16 num) public view returns (string memory) {
        bytes memory result = "";
        uint16 temp = num;
        for (uint i = 0; i<intArr.length; i++) {
            if (temp >= intArr[i]) {
                temp -= intArr[i];
                result = abi.encodePacked(result, romanArr[i]);
            }
        }
        return string(result);
    }
}
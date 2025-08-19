// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task03{
    
    mapping (string => uint16) private romanMap;

    constructor(){
        romanMap["I"] = 1;
        romanMap["V"] = 5;
        romanMap["X"] = 10;
        romanMap["L"] = 50;
        romanMap["C"] = 100;
        romanMap["D"] = 500;
        romanMap["M"] = 1000;
    }

    function romanToInt(string calldata str) public view returns (uint) {
        uint16 result = 0;
        bytes memory romanBytes = bytes(str);
        bytes memory buffer = new bytes(1);
        uint len = romanBytes.length;
        for (uint16 i = 0; i< len; i++) {
            buffer[0] = romanBytes[i];
            string memory s = string(buffer);
            uint16 num = romanMap[s];
            if( i +1 < len){
                buffer[0] = romanBytes[i+1];
                uint16 nextNum = romanMap[string(buffer)];
                if(nextNum > num){
                    i++;
                    result += nextNum - num;
                    continue ;
                }
            }
            result += num;
        }
        return result;
    }
}
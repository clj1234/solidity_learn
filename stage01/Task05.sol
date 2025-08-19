// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task05{


    function mergeSortedArray(uint[] memory arr1,uint[] memory arr2) public pure returns (uint[] memory) {
        uint[] memory result = new uint[](arr1.length +arr2.length);
        uint resultIndex = 0;
        for(uint i = 0; i < arr1.length; i++){
            result[resultIndex] = arr1[i];
            resultIndex++;
        }
        for(uint i = 0; i < arr2.length; i++){
            result[resultIndex] = arr2[i];
            resultIndex++;
        }
        return result;
    }
}
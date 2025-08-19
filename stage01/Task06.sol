// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task06{
    function binarySearch(uint[] memory arr,uint target) public pure returns (uint) {
        uint result = 0;
        uint left = 0;
        uint right = arr.length -1;
        uint middle = arr.length /2;
            while(true){
                if(left == right){
                    if(arr[left] == target){
                        result = left;
                    }
                    break;
                }
                if(arr[middle] == target){
                    return middle;
                } else if(arr[middle] < target){
                    left = middle +1;
                }else {
                    right = middle;
                }
                middle = left + (right -left)/2;
            }
        return result;
}
}
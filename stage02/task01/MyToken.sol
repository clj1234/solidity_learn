// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MyToken {
    mapping (address =>uint) private balancesMap;

    mapping (address => mapping (address => uint)) private allowances;

    address private owner;

    string public symbol;

    string public name;

    uint public decimals;


    constructor(string memory _symbol , string memory _name,uint _decimals){
        owner = msg.sender;
        symbol = _symbol;
        name = _name;
        decimals = _decimals;
        mint(owner, 100000);
    }

    event Transfer(address indexed from ,address indexed to,uint indexed value);

    event Approval(address indexed owner,address indexed spender,uint indexed value);

    function balanceOf(address _address) public view returns (uint) {
        return balancesMap[_address];
    }

    function transfer(address  to, uint256 value) public {
        address from = msg.sender;
        uint fromTokenNum = balancesMap[from];
        if(fromTokenNum < value){
            revert("balance not enough");
        }
        balancesMap[from] = fromTokenNum - value;
        balancesMap[to] = balancesMap[to] + value;
        emit Transfer(from, to, value);
    }

    function approve(address spender, uint256 value) public virtual returns (bool) {
        address sender = msg.sender;
        // 修改授权余额
        allowances[sender][spender] = value;
        emit Approval(sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        address sender = msg.sender;
        uint allowance = allowances[from][sender];
        if(allowance < value){
            revert("allowance not enough");
        }
        // 修改授权余额
        allowances[from][sender] = allowance - value;
        // 修改代币余额
        uint fromBalance = balancesMap[from];
        if(fromBalance < value ){
            revert("balance not enough");
        }
        balancesMap[from] = fromBalance - value;
        balancesMap[to] = balancesMap[to] + value;
        return true;
    }

    function mint(address to, uint256 value) public {
        address sender = msg.sender;
        if(sender != owner){
            revert("not owner");
        }
        uint balance = balancesMap[to];
        balancesMap[to] = balance + value;
    }
}
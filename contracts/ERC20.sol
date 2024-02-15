// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "./IERC20.sol";

contract ERC20Token is IERC20 {
    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalTokenSupply
    ) {
        name = _name;
        symbol = _symbol;
        decimal = 18;
        totalTokenSupply = _totalTokenSupply * 10 ** decimal;
    }

    mapping(address => uint256) balanceOf;
    mapping(address => mapping(address => uint256)) allowance;

    function transfer(
        address _owner,
        address _reciever,
        uint256 _value
    ) internal returns (bool) {
        require(
            _reciever != address(0),
            "withdrawal to zero address is prohibited"
        );
        require(balanceOf[msg.sender] >= _value, "insufficient funds");
        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        uint _burnAmount = (_value * 10) / 100;
        burn(_burnAmount);

        balanceOf[_reciever] = balanceOf[_reciever] + _value;
        totalTokenSupply = totalTokenSupply - _burnAmount;
        emit Transfer(_owner, _reciever, _value);
        return true;
    }

    function approve(
        address _spender,
        uint256 _value
    ) external override returns (bool) {
        allowance[msg.sender][_spender] = _value;
        emit Approved(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(
        address _sender,
        address _reciever,
        uint256 _value
    ) external override returns (bool) {
        require(_value <= allowance[_sender][msg.sender]);
        allowance[_sender][msg.sender] =
            allowance[_sender][msg.sender] -
            _value;

        balanceOf[_sender] = balanceOf[_sender] - _value;
        balanceOf[_reciever] = balanceOf[_reciever] + _value;
        return true;
    }

    function burn(uint256 _amount) public {
        require(_amount > 0, "burn amount must be greater than 0");
        require(balanceOf[msg.sender] >= _amount);
        payable(address(0)).transfer(_amount);
    }
}

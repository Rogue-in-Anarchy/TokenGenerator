// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract IERC20 {
    string public name;
    string public symbol;
    uint8 public decimal;
    uint256 public totalTokenSupply;

    // emiting transfer events
    event Transfer(address indexed from, address indexed to, uint256 value);

    // emmiting event when allowance on a transaction is approved
    event Approved(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    //returns value of the total tokens in existence
    // function totalSupply() external view virtual returns (uint256);

    // returns the total value of tokens owned by the user
    // function balanceOf(address account) external view virtual returns(uint256);

    // returns the total token allowed by the owner to the spender
    // function allowance(address owner, address spender) external view virtual returns (uint256);

    // stipulates a given amount(allowance) to the spender
    function approve(
        address spender,
        uint256 value
    ) external virtual returns (bool);

    // transfers value "from" owner "to" spender using the allowance functions
    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external virtual returns (bool);
}

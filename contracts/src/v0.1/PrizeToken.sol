// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PrizeToken is ERC20("Prize Token", "PT")
{
    uint256 private cap = 1000_000_000_000 * 10**uint256(18);
    constructor() {
        _mint(msg.sender, cap);
    }
}

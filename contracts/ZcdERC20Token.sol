// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.1/token/ERC20/ERC20.sol";


contract ZCDToken  {

    constructor() ERC20("ZCD Token", "ZCDT") {
        _mint(msg.sender, 100 * 10 ** decimals());
    }

}
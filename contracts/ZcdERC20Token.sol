// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.1/token/ERC20/ERC20.sol";


contract ZCDToken is ERC20  {

    constructor() ERC20("ZCD Token", "ZCDT") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

}
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.17;

contract Bank {

    function Bank() payable public {

    }

    function incrementBalance(uint256 amount) payable public {
        require(msg.value == amount);
    }

    function getBalance() public {
        msg.sender.transfer(address(this).balance);
    }
}

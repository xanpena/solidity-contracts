// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.17;

contract Bank {

    address owner;

    function Bank() payable public {
        owner = msg.sender;
    }

    function incrementBalance(uint256 amount) payable public {
        require(msg.value == amount);
    }

    function withdrawBalance() public {
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
    }
}

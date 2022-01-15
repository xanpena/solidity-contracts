// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.17;

contract Bank {

    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
    }

    function newOwner(address newOwner) public onlyOwner{
        owner = newOwner;
    }

    function Bank() payable public {
        owner = msg.sender;
    }

    function incrementBalance(uint256 amount) payable public {
        require(msg.value == amount);
    }

    function withdrawBalance() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }
}
